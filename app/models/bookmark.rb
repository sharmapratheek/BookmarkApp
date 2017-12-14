class Bookmark < ApplicationRecord 
	validates :bookmark_name ,presence: true,,length: {maximum: 30}
	belongs_to :user


  has_many :links
end