FactoryBot.define do
  factory :prompt do
    prompt { 'a white siamese cat' }
    number_images { 2 }
    size { '256x256' }
  end
end
