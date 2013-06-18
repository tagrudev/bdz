module Bdz
  module Parser
    class Schedule
      attr_accessor :price_url

      def initialize(response)
        @response = response
      end

      def parse
        @content = Nokogiri::HTML(@response.body)
        parse_content
      end

      def parse_content
        begin
          @content.css('tbody tr').take(@content.css('tbody tr').size - 1).collect do |train|
             t = Bdz::Train.new(
                   :id => train.css('td a')[0].text,
                   :type => train.css('td')[1].text,
                   :leaves => train.css('td')[2].text,
                   :arrives => train.css('td')[3].text,
                 )
          end
          # @price_url = @content.css('tbody tr').take(@content.css('tbody tr').size).css('td a')[0]
        rescue
          return []
        end
      end
    end
  end
end
