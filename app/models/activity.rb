class Activity < ApplicationRecord
    belongs_to  :zone
    has_many :collections
end
