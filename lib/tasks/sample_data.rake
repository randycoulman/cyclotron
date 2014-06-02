namespace :db do
  desc "Fill the database with sample data"
  task populate: :environment do
    Bike.create!(name: "Mountain Bike")
    Bike.create!(name: "Road Bike")
    Bike.create!(name: "Hybrid")
    Bike.create!(name: "Cross")

    100.times do |n|
      name = Faker::Address.street_name
      description = Faker::Lorem.sentence
      Route.create!(name: name, description: description)
    end
  end
end
