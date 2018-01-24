class ResourceActivitiesTree < ApplicationRecord
	belongs_to  :resource_activity 
	belongs_to  :tree
end
