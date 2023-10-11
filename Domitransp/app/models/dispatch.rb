class Dispatch < ApplicationRecord
    has_many :orders
    def hora_ruta
        "#{horario.strftime('%H:%M')} - #{ruta}"
    end
end
