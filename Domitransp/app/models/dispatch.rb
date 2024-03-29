class Dispatch < ApplicationRecord
    has_many :orders
    CIUDADES = ['Barranquilla', 'Sincelejo', 'Cartagena', 'Santa Marta', 'Valledupar', 'Monteria'].freeze
    validates :destino, presence: true
    validates :origen, presence: true
    validates :horario, presence: true
    validate :validar_formato_de_ruta
    validate :unique_hour_and_destination

    def unique_hour_and_destination
      existing_route = Dispatch.find_by(horario: horario, destino: destino, origen:origen)
      
      if existing_route && (existing_route.id != id || new_record?)
        errors.add(:horario, 'Ya existe una ruta con la misma hora y destino')
      end
    end
    def hora_ruta
      "#{horario.strftime('%H:%M')} / #{origen} - #{destino} "
    end
  
    private
  
    def validar_formato_de_ruta
      unless "#{origen} - #{destino}" =~ /\A[A-Za-z\s]+ - [A-Za-z\s]+\z/
        errors.add(:ruta, "El formato de la ruta no es válido. Debe ser 'Ciudad Origen - Ciudad Destino'.")
      end
    end    
end
  