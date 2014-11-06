module Jarvis
  module Services
    class NPHService < BaseService
      def say
        [
          "http://i.imgur.com/Anl7UDF.jpg",
          "http://i.imgur.com/tfZ7Z8X.jpg",
          "http://i.imgur.com/cS602MC.jpg",
          "http://i.imgur.com/qUz77Nj.jpg"
        ].sample
      end
    end
  end
end
