class Freetable

	FUNCTIONFAIL  = '{"result": "-0"}'
	RETURNFAIL    = '{"result": "0"}'
	RETURNSUCCESS = '{"result": "1"}'

	def validate( values, types )
	  fail = false
  	bake = []
  	(0..values.length).each do |c|
  		bake.push([values[c], types[c]])
  	end

  	bake.each do |myeval|
    	case myeval.last
      	when 'uuid'
        	fail = true if myeval.first !~ /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/
      	when 'integer'
        	fail = true if myeval.first.to_i == myeval.first
      	when 'password'
        	fail = true if myeval.first !~ /^[0-9a-f]{128}$/
				when 'username'
					fail = true if myeval.first =~ /\'|\"/
				when 'email'
					fail = true if myeval.first !~ /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
    end
  end
	return fail
	end

end
