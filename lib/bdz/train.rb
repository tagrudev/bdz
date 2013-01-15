module Bdz
  class Train
    attr_reader :id
    attr_reader :leaves
    attr_reader :arrives
    attr_reader :type
    attr_reader :docks
    def initialize (params)
      return if params.nil?

      params.each do |key, value|
        name = key.to_s
        instance_variable_set("@#{name}", value) if respond_to?(name)
      end
    end

    def as_json
      hash = {}
      self.instance_variables.each do |var|
        hash[var.to_s.gsub("@", "")] = self.instance_variable_get var
      end
      hash.to_json
    end
  end
end
