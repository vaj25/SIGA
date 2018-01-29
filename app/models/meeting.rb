class Meeting < ApplicationRecord
  belongs_to  :activity
  has_many :diaries
end
