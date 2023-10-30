class Dispatch < ApplicationRecord
    has_many :orders
    validates :ruta, presence: true
    validates :horario, presence: true
    validate :validar_formato_de_ruta
  
    def hora_ruta
      "#{horario.strftime('%H:%M')} / #{ruta}"
    end
  
    private
  
    def validar_formato_de_ruta
      unless ruta.match?(/\A[A-Za-z\s]+ - [A-Za-z\s]+\z/)
        errors.add(:ruta, "El formato de la ruta no es válido. Debe ser 'Ciudad Origen - Ciudad Destino'.")
      end
    end
end
  