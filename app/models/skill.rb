# == Schema Information
#
# Table name: skills
#
#  id   :integer          not null, primary key
#  name :string           not null
#

class Skill < ApplicationRecord
  has_and_belongs_to_many :users

  validates :name, presence: true, uniqueness: true
end
