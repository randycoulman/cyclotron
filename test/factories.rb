FactoryGirl.define do
  factory :bike do
    name "A bike"
  end

  factory :route do
    sequence(:name) { |n| "Route #{n}" }
    description "This is a fun route"
  end
end
