namespace :db do
  desc "Fill the database with sample data"
  task populate: :environment do
    Bike.create!(name: "Mountain Bike")
    Bike.create!(name: "Road Bike")
    Bike.create!(name: "Hybrid")
    Bike.create!(name: "Cross")
  end
end
