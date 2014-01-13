module Freetable

	FUNCTIONFAIL  = '{"result": "-0"}'
	RETURNFAIL    = '{"result": "0"}'
	RETURNSUCCESS = '{"result": "1"}'

	def validate( values, types )
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
      	when 'password'
        	fail = true if val !~ /^[0-9a-f]{128}$/
				when 'username'
					fail = true if val =~ /\'|\"/
				when 'email'
					fail = true if val !~ /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
    end
  end
	return !fail
	end

end