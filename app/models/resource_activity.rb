class ResourceActivity < ApplicationRecord
	belongs_to  :activity
    has_many :resource_activities_tree
end
