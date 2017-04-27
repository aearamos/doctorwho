#!/usr/bin/env ruby -U

require 'open-uri'
require 'nokogiri'

Treatmentspecialty.destroy_all
Specialty.destroy_all
Review.destroy_all
Doctor.destroy_all
User.destroy_all

specialties = []
users = []
doctors = []
treatmentspecialties = []


specialties << Specialty.create!(name: "Cardiology")
specialties <<Specialty.create!(name: "Neurology")
specialties <<Specialty.create!(name: "General")
specialties <<Specialty.create!(name: "Psychology")
specialties <<Specialty.create!(name: "Immunology")
specialties <<Specialty.create!(name: "Oncoology")

5.times do
  users << User.create!(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456"
  )
end

2.times do |i|
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
        specialty = doc.search('.title #doctorSpecialities p')[0].text.sub('Ver Mais','').sub('Ver Menos','').sub('ver mais','')
        crm = doc.search('p.regnum').size.positive? ? doc.search('p.regnum')[0].text.sub("Número de Identificação Profissional: ", '') : "Não disponível."
        web = doc.search('.website-links a')
        website = web.size.positive? ? web.attribute('href').value : "Não Disponível."
        img = doc.search('.entity-actions').search('img')
        photo_id = img.size.positive? ? img.attribute('src').value : "Foto indisponível."
        root = doc.search('.location.d')
        insurance = root.search('p.insurances').text.sub('Atende: ','')
        address = root.search('.address .street').text.gsub(/\s+/, ' ').strip
        #hours = root.search('p.openinghours').text.strip.sub('Horário: ','').gsub(/\r\n+/, ' ')
        description = doc.search('.history div').text.strip.gsub(/\n\n+/, ' ').sub('Ver Mais','').sub('Ver Menos','').sub('Ver maisVer menos','.').gsub(/\r\n+/, ' ').gsub(/\n+/, ' ').gsub(/\t\t+/, ' ').gsub(/\t+/, ' ').gsub(/\+/, ' ')
        city_name = "São Paulo"
        activity = true
        phone = "Não disponível."
        doctors << Doctor.create!(name: name, street_name: address, city_name: city_name, description: description, crm: crm, activity: activity, insurance: insurance, photo: photo_id, website: website, phone: phone)
      end
    end
  end
end


40.times do
  treatmentspecialties << Treatmentspecialty.create!(
    doctor: doctors.sample,
    specialty: specialties.sample,
    )
end


30.times do
  Review.create!(
  title: Faker::Lorem.sentence,
  comment: Faker::Lorem.paragraph(2),
  rating: (1..5).to_a.sample,
  date_of_consultancy: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
  user: users.sample,
  doctor: doctors.sample
  )
end

