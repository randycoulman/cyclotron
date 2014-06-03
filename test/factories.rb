FactoryGirl.define do
  factory :bike do
    name "A bike"
  end

  factory :route do
    sequence(:name) { |n| "Route #{n}" }
    description "This is a fun route"
  end

  factory :ride do
    bike
    route
    sequence(:rode_on) { |n| n.days.ago }
    distance 32.5
    speed 17.6
    notes "Some notes"
  end
end
