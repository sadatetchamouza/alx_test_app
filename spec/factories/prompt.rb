FactoryBot.define do
  factory :prompt do
    prompt { 'a white siamese cat' }
    number_images { 2 }
    size { '256x256' }

    trait :with_outputs do
      after(:create) do |prompt|
        2.times do
          create(:output, prompt: prompt)
        end
      end
    end
  end
end
