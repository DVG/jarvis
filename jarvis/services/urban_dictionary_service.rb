module Jarvis
  module Services
    class UrbanDictionaryService < BaseService

      MAX_DEFINITION_LENGTH = 200

      def run
        @response = HTTParty.get('http://api.urbandictionary.com/v0/random?page=1&format=json')
        self
      end

      def say
        pick_a_winner
      end

      private

      # *** Currently, Urban Dictionary returns multiple dictionary entries. Let's pick the best scored word.
      def pick_a_winner
        entries = @response.parsed_response['list']
        best_entry = entries.max_by {|i| i['thumbs_up'].to_i - i['thumbs_down'].to_i }
        moar_dots = best_entry['definition'].to_s.length > MAX_DEFINITION_LENGTH ? '...' : ''
        
        "\"#{best_entry['word']}\" : #{best_entry['definition'].to_s[0...MAX_DEFINITION_LENGTH].capitalize}#{moar_dots}"
      end
    end
  end
end
