# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

15.times do
  doctors << Doctor.create!(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    street_name: Faker::Address.street_address,
    city_name: Faker::Address.city,
    gender: ["female", "male"].sample,
    description: Faker::Lorem.paragraph(2),
    crm: (1000..5000).to_a.sample,
    activity: true,
    phone: Faker::PhoneNumber.phone_number,
    user: users.sample
  )
end


20.times do
  treatmentspecialties << Treatmentspecialty.create!(
    doctor: doctors.sample,
    specialty: specialties.sample,
    )
end


30.times do
  Review.create!(
  title: Faker::Lorem.sentence,
  comment: Faker::Lorem.paragraph(2),
  Rating: (1..5).to_a.sample,
  date_of_consultancy: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
  user: users.sample,
  doctor: doctors.sample
  )
end






