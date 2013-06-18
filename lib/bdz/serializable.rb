module Bdz
  module Serializable
    def as_hash
      hash = {}
      self.instance_variables.each do |var|
        hash[var.to_s.gsub("@", "")] = self.instance_variable_get var
      end
      hash
    end
  end
end
