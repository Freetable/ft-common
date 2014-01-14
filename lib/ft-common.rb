class Freetable

	FUNCTIONFAIL  = '{"result": "-0"}'
	RETURNFAIL    = '{"result": "0"}'
	RETURNSUCCESS = '{"result": "1"}'

	def self.validate( values, types, log )
	  fail = false
  	bake = []
  	(0..values.length).each do |c|
  		bake.push([values[c], types[c]])
  	end

  	bake.each do |val,type|
    	case type
      	when 'uuid'
        	fail = true if val !~ /^[\h]{8}-[\h]{4}-[\h]{4}-[\h]{4}-[\h]{12}$/
      	when 'integer'
        	fail = true if val.to_i != val
				when 'username'
					fail = true if val =~ /\'|\"/
				when 'email'
					fail = true if val !~ /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
        when 'year'
          fail = true if val !~ /^[\d]{4}$/
        when 'md5'
          fail = true if val !~ /^[\h]{32}$/
        when 'sha1'
          fail = true if val !~ /^[\h]{160}$/
        when 'sha512'
          fail = true if val !~ /^[\h]{128}$/
        when 'skip'
          1
    end
  end
	return !fail
	end

end