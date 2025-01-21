# == Schema Information
#
# Table name: interests
#
#  id   :integer          not null, primary key
#  name :string           not null
#

class Interest < ApplicationRecord
  has_and_belongs_to_many :users

  validates :name, presence: true, uniqueness: true
end
