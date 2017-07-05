FactoryGirl.define do
  factory :product do
    name 'Sample name'
    description 'Some sample description'
    price 22.33
    image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/sample_image_01.png')))
  end
end
