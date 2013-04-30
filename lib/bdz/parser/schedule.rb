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
            @content.css('tbody').take(@content.css('tbody').size - 1).collect do |train|
              t = Bdz::Train.new(
                                 :id => train.css('tr td a')[0].text,
                                 :type => train.css('tr td')[1].text,
                                 :leaves => train.css('tr td')[2].text,
                                 :arrives => train.css('tr td')[3].text,
                                 )
            end
          end
  	end
  end
end
