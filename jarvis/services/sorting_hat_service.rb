module Jarvis
  module Services
    class SortingHatService < BaseService
      def say
        [
          "Wit beyond measure is man's greatest treasure. You're a RAVENCLAW",
          "Gryffindor, where dwell the brave at heart",
          "You have much ambition, to Slytherine with you!",
          "HUFFLEPUFF. The world needs janitors too"
        ].sample
      end
    end
  end
end
