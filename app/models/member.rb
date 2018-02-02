class Member < ApplicationRecord
  belongs_to  :charge
  has_many    :general_meetings
  has_many    :meetings
end

def nombre_completo
   "#{primer_nombre} #{segundo_nombre} #{primer_apellido} #{segundo_apellido}"
 end
