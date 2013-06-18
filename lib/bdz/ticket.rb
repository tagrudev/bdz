module Bdz
  class Ticket
    include Serializable
    attr_reader :id
    attr_reader :type
    attr_reader :price
    def initialize (params)
      return if params.nil?
      params.each do |key, value|
        name = key.to_s
        instance_variable_set("@#{name}", value) if respond_to?(name)
      end
    end
  end
end
