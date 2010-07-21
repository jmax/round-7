require 'persona'

describe Persona do
  # Todo lo que esta dentro del metodo "before" se evalua siempre antes de cada
  # bloque "it".
  before(:each) do
    @persona = Persona.new
  end

  context 'Atributos' do
    it "debería poder acceder a nombre" do
      @persona.should respond_to(:nombre)
      @persona.should respond_to(:nombre=)
    end

    it "debería poder acceder a apellido" do
      @persona.should respond_to(:apellido)
      @persona.should respond_to(:apellido=)
    end

    it "debería poder acceder a edad" do
      @persona.should respond_to(:edad)
      @persona.should respond_to(:edad=)
    end
  end

  context 'Validaciones' do
    before(:each) do
      @persona.nombre   = 'Juan'
      @persona.apellido = 'Perez'
      @persona.edad     = 23
    end

    it "debería ser válido si tiene nombre, apellido y edad" do
      # Aquí es equivalente a poner
      #   @persona.valido?.should be_true o @persona.valido?.should  == true
      @persona.should be_valido
    end

    it "no debería ser válido sin nombre" do
      @persona.nombre = nil
      @persona.should_not be_valido
    end

    it "no debería ser válido sin apellido" do
      @persona.apellido = nil
      @persona.should_not be_valido
    end

    it "no debería ser válido sin edad" do
      @persona.edad = nil
      @persona.should_not be_valido
    end

    it "no debería ser válido una edad que no sea numerica" do
      @persona.edad = 'hola'
      @persona.should_not be_valido
    end
  end

  context 'Helpers' do
    it "debería dar su nombre completo" do
      @persona.nombre   = 'Juan'
      @persona.apellido = 'Perez'
      @persona.nombre_completo.should == 'Juan Perez'
    end

    it "debería saber si es mayor de edad" do
      @persona.edad = 23
      @persona.should be_mayor_de_edad
      @persona.edad = 15
      @persona.should_not be_mayor_de_edad
    end
  end

  context 'Integracion Facebook' do
    it "debería conectarse via Facebook"
    it "debería poder obtener sus amigos en Facebook"
  end
end

