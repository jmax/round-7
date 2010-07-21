class Persona
  attr_accessor :nombre, :apellido, :edad

  def nombre_completo
    "#{nombre} #{apellido}"
  end

  def mayor_de_edad?
    edad >= 18
  end

  def valido?
   campos_completos? && edad_valida?
  end

protected

  def campos_completos?
    nombre && apellido && edad
  end

  def edad_valida?
    edad && edad.to_i > 0
  end

end

