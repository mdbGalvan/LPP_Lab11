# File : lambdaRegexp.rb

module ULL
  module ETSII
    module Alu3299
      module LambdaRegexp
      	
                module_function

                # | Disyunción: ó
                def alt(left, right)
                  lambda { |x|  left[x] or right[x] }
                end

                # Cadena
                def char(c)
                  lambda { |x| x[0,c.length] == c and x[c.length..-1] }
                end

                # e : Cadena vacía
                def epsilon
                  lambda {|x| x }
                end

                # + Cierre Positivo de Kleene: una o más repeticiones
                def plus(r)
                  lambda { |x| seq(r, star(r))[x] }
                end

                # · Concatenación: seguido de
                def seq(left, right)
                  lambda { |x| w = left[x] and right[w] }
                end

                # * Cierre Estrella de Kleene: cero o más repeticiones
                def star(r)
                  lambda { |x| plus(r)[x] or epsilon[x] }
                end

                # ? : cero o una repetición
                def question(r)
                    lambda { |x| alt(r, epsilon)[x] }
                end

            end
        end
    end
end

class Proc
    include ULL::ETSII::Alu3299::LambdaRegexp

    # · Concatenación: seguido de
    def - (r)
        seq(self, r)
    end

    # | Disyunción: ó
    def | (r)
        alt(self, r)
    end

    # + Cierre Positivo de Kleene: una o más repeticiones
    def +@
        plus(self)
    end

    # * Cierre Estrella de Kleene: cero o más repeticiones
    def ~@
        star(self)
    end

    # ? : cero o una repetición
    def -@
        question(self)
    end

end

class String
    include ULL::ETSII::Alu3299::LambdaRegexp

    # Cadena
    def re
        char(self)
    end
end