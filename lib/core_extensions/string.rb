class String
	def lcamelize
		self.gsub(/_(.)/) {|e| $1.upcase}
	end
end