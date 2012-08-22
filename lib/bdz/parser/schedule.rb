module Bdz
  module Parser
  	class Schedule 
      def initialize(response)
        @response = response
      end

      def parse
        @content = Nokogiri::HTML(@response.body)
        parse_content
      end

      def parse_content
        @content.css('div.accordionTabTitleBar').collect do |train|
          t = Bdz::Train.new(
            :id => train.css('table tr td')[0].text,
            :leaves => train.css('table tr td')[1].text,
            :arrives => train.css('table tr td')[2].text,
            :type => train.css('table tr td')[3].text,
            :docks => train.css('table tr td')[4].text
            )
        end 
      end
  	end
  end
end
