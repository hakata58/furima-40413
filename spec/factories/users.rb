FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'test0000'}
    password_confirmation {password}
    surname               {'山田'}
    name                  {'陸太郎'}
    surname_katakana      {'ヤマダ'}
    name_katakana         {'リクタ'}
    birthdate             {'1948-10-17'}
  end
end