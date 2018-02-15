class Activity < ApplicationRecord
    belongs_to  :zone
    has_many :collections
    has_many :resource_activity
    has_many :general_meetings
    has_many :activity_contacts
end

def campos_utiles
   "Código: #{id}, Tipo: #{tipo}, Fecha:#{fecha_inicio}, Zona:#{zone.nombre}"
 end
