FactoryBot.define do
  factory :interest do
    sequence(:name) { |i| "football_#{i}" }
  end
end
