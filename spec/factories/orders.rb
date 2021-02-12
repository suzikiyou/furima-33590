FactoryBot.define do
  factory :order do
    token             {"tok_abcdefghijk00000000000000000"}
    zip_code          { '123-4567' }
    prefecture_id     { 1 }
    municipality      { '横浜市緑区' }
    street_number     { '青山1-1-1' }
    building_name     { '柳ビル103'}
    telephone_number  { '00000000000' }
  end
end
