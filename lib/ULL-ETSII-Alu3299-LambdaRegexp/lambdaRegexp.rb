# File : lambdaRegexp.rb

module ULL
  module ETSII
    module Alu3299
      module LambdaRegexp
        
        module_function

        # File lambda-regexp.rb, line 61
		def alt(left, right)
		  lambda { |x|  left[x] or right[x] }
		end

		# File lambda-regexp.rb, line 77
		def char(c)
		  lambda { |x| x[0,c.length] == c and x[c.length..-1] }
		end

		# File lambda-regexp.rb, line 37
		def epsilon
		  lambda {|x| x }
		end

		# File lambda-regexp.rb, line 53
		def plus(r)
		  lambda { |x| seq(r, star(r))[x] }
		end

		# File lambda-regexp.rb, line 69
		def seq(left, right)
		  lambda { |x| w = left[x] and right[w] }
		end

		# File lambda-regexp.rb, line 45
		def star(r)
		  lambda { |x| plus(r)[x] or epsilon[x] }
		end

		alias | alt
		alias re char
		alias + plus
		alias - seq
		alias * star

      end
    end
  end
end
