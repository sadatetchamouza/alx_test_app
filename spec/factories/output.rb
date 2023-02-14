FactoryBot.define do
  factory :output do
    url { Faker::LoremFlickr.image }
  end
end
