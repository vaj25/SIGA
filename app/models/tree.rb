class Tree < ApplicationRecord
	has_many :detail_income 
	#has_many :resource_activities_tree, dependent: :destroy

end
