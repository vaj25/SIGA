class Meeting < ApplicationRecord
  has_many    :general_meetings
  belongs_to  :activity
end
