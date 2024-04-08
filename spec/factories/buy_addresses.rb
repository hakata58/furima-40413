FactoryBot.define do
  factory :buy_address do




    item_id                 { '3' }
    buy_id                 { '3' }
    user_id                 { '3' }
    post_code              { '123-4567' }
    prefectures_id             { '2' }
    municipaloties             { '横浜市緑区' }
    street_address            { '青山1-1-1' }
    building_name              { '青山マンション' }
    telephone             { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
    
  end
end
