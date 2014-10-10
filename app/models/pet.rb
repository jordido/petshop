class Pet < ActiveRecord::Base
	validates :name, presence: true	
	belongs_to :animal
	belongs_to :user
end
