# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  surname     :string           not null
#  patronymic  :string           not null
#  full_name   :string           not null
#  email       :string           not null
#  age         :integer          not null
#  nationality :string           not null
#  country     :string           not null
#  gender      :string           not null
#

class User < ApplicationRecord
  has_and_belongs_to_many :interests
  has_and_belongs_to_many :skills

  validates(
    :full_name,
    :email,
    :age,
    :nationality,
    :country,
    :gender,
    presence: true
  )

  validates :email, uniqueness: true
end
