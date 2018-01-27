class Member < ApplicationRecord
  belongs_to  :charge
  has_many    :general_meetings
end
