class Activity < ApplicationRecord
    belongs_to  :zone
    has_many :collections
    has_many :resource_activity
    has_many    :general_meetings
end
