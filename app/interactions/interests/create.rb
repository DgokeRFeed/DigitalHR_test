module Interests
  class Create < ActiveInteraction::Base
    string :name

    validates :name, presence: true

    def execute
      interest = Interest.new({ name: })

      unless interest.save
        errors.merge!(interest.errors)
      end

      interest
    end
  end
end
