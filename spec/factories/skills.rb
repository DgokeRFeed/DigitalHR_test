FactoryBot.define do
  factory :skill do
    sequence(:name) { |i| "git_master_#{i}" }
  end
end
