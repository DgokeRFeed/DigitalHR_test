FactoryBot.define do
  factory :user do
    surname { 'chicha' }
    name { 'sergey' }
    patronymic { 'vitalyevich' }
    full_name {'chicha sergey vitalyevich'}

    sequence(:email) { |i| "shish#{i}@shish.lol" }

    age { 25 }
    gender { 'male' }

    country { 'tatarstan' }
    nationality { 'ultratatar' }
  end
end
