# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#!/usr/bin/env ruby -U

require 'open-uri'
require 'nokogiri'
doctors = []

10.times do |i|
  html_file = open("http://www.doctoralia.com.br/medicos/cidade/sao+paulo-116705/#{i+1}")
  #  html_file = open("http://www.doctoralia.com.br/medicos/cidade/sao+paulo-116705/5")

  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('#main').each do |page|
    10.times do |j|
      #new_url = "http://www.doctoralia.com.br" + page.search('h3 a').attribute('href').value
      new_url = "http://www.doctoralia.com.br" + page.search('h3 a')[j+1].attribute('href').value
      new_html_file = open(new_url)
      new_html_doc = Nokogiri::HTML(new_html_file)

      new_html_doc.search('#main').each do |doc|
        name = doc.search('.title h1').text
        specialty = doc.search('.title #doctorSpecialities p').text.sub('Ver Mais','').sub('Ver Menos','').sub('ver mais','')
        crm = doc.search('p.regnum').size.positive? ? doc.search('p.regnum')[0].text.sub("Número de Identificação Profissional: ", '') : "Não disponível."
        website = doc.search('section.website p')
        img = doc.search('.entity-actions').search('img')
        photo_id = img.size.positive? ? img.attribute('src').value : "Foto indisponível"
        root = doc.search('.location.d')
        insurance = root.search('p.insurances').text.sub('Atende: ','')
        address = root.search('.address .street').text.gsub(/\s+/, ' ').strip
        #hours = root.search('p.openinghours').text.strip.sub('Horário: ','').gsub(/\r\n+/, ' ')
        description = doc.search('.history div').text.strip.gsub(/\n\n+/, ' ').sub('Ver Mais','').sub('Ver Menos','').gsub(/\r\n+/, ' ').gsub(/\n+/, ' ').gsub(/\t\t+/, ' ').gsub(/\t+/, ' ').gsub(/\+/, ' ')
        city_name = "São Paulo"
        activity = true
        phone = "Não disponível."
        doctor = Doctor.new(name: name, street_name: address, city_name: city_name, description: description, crm: crm, activity: activity, insurance: insurance, photo: photo_id, website: website, phone: phone)
        doctor.save
      end
    end
  end
end
