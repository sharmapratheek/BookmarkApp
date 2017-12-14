class AddBookmarkToLinks < ActiveRecord::Migration[5.1]
  def change
  	  	add_reference :links, :bookmark, index: true, foreign_key: true
  end
end
