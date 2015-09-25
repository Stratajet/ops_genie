require "core_extensions/string"
class Hash
	def camelize_lower_keys!
	  self.keys.each do |key|
	  	value = delete(key)
	    if key.is_a? String
	      self[key.lcamelize] = value
	    elsif key.is_a? Symbol
	      self[key.to_s.lcamelize.to_sym] = value
	    end
	  end
	end
end