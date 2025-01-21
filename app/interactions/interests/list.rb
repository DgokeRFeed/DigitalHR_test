module Interests
  class List < ActiveInteraction::Base
    def execute
      Interest.all
    end
  end
end
