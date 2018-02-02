class Activity < ApplicationRecord
    belongs_to  :zone
    has_many :collections
    has_many :resource_activity
    has_many    :general_meetings
end

def campos_utiles
   "Código: #{id}, Tipo: #{tipo}, Fecha:#{fecha_inicio}, Zona:#{zone.nombre}"
 end
