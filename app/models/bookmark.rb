class Bookmark < ApplicationRecord 
	validates :bookmark_name ,presence: true 
	belongs_to :user
end