FactoryBot.define do
  factory :item do
   proprietary_name     { 'test' }
   product_description  { 'test' }
   category_id          { 1 }
   condition_id         { 1 }
   shipping_charge_id   { 1 }
   prefecture_id       { 1 }
   day_id              { 1 }
   price                { 1000 }
   association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_images.jpeg'), filename: 'test_images.jpeg')
    end
  end
  # trait :image do
  #   image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/sample.png')) }
  # end
end
