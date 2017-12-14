class Link < ApplicationRecord
		# belongs_to :bookmark

	validates :link ,presence: true ,length: {minimum: 3,maximum: 250}
	validates_uniqueness_of :link 

end