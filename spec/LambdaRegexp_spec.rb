require 'LambdaRegexp'

describe ULL::ETSII::Alu3299::LambdaRegexp do

    include ULL::ETSII::Alu3299::LambdaRegexp

    before :all do
        @er1 = char('c')
        @er2 = char('d')
    end

    describe "#Metodos" do
        it "Se debe invocar el metodo alt() para recoger la union de dos ER" do
            e = alt(@er1, @er2)
            s = 'cddde'
            remaining = e[s]
            remaining.should == "ddde"
        end

        it "Se debe invocar el metodo char() para recoger una ER" do
            e = char('cd')
            s = 'cddde'
            remaining = e[s]
            remaining.should == "dde"
        end

        it "Se debe invocar el metodo epsilon() para escoger la cadena vacia" do
            e = epsilon()
            s = 'cddde'
            remaining = e[s]
            remaining.should == "cddde"
        end

        it "Se debe invocar el metodo plus() para recoger el Cierre Estrella de Kleene de una ER" do
            e = plus(@er1)
            s = 'cddde'
            remaining = e[s]
            remaining.should == "ddde"
        end

        it "Se debe invocar el metodo seq() para recoger la concatenacion de dos ER" do
            e = seq(@er1, @er2)
            s = 'cddde'
            remaining = e[s]
            remaining.should == "dde"
        end

        it "Se debe invocar el metodo star() para recoger el Cierre positivo de Kleene de una ER" do
            e = star(@er1)
            s = 'cddde'
            remaining = e[s]
            remaining.should == "ddde"
        end

        it "Se debe invocar el metodo question() para recoger cero o una repeticion de una ER" do
            e = star(@er2)
            s = 'cddde'
            remaining = e[s]
            remaining.should == "cddde"
        end
    end

    describe "#Operador" do
       it "Se debe invocar el metodo -(r) para recoger la concatenacion de dos ER" do
            e = @er1 - @er2
            s = 'cddde'
            remaining = e[s]
            remaining.should == "dde"
        end 

        it "Se debe invocar el metodo | (r) para recoger la union de dos ER" do
            e = @er1 | @er2
            s = 'cddde'
            remaining = e[s]
            remaining.should == "ddde"
        end

        it "Se debe invocar el metodo +@ para recoger el Cierre Estrella de Kleene de una ER" do
            e = +(@er1)
            s = 'cddde'
            remaining = e[s]
            remaining.should == "ddde"
        end

        it "Se debe invocar el metodo ~@ para recoger el Cierre positivo de Kleene de una ER" do
            e = ~(@er1)
            s = 'cddde'
            remaining = e[s]
            remaining.should == "ddde"
        end

        it "Se debe invocar el metodo -@ para recoger cero o una repeticion de una ER" do
            e = -(@er2)
            s = 'cddde'
            remaining = e[s]
            remaining.should == "cddde"
        end

        it "Se debe invocar el metodo re() para recoger una ER" do
            e = 'cd'.re
            s = 'cddde'
            remaining = e[s]
            remaining.should == "dde"
        end

    end

end