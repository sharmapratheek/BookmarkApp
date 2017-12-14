class AddLinkToBookmarks < ActiveRecord::Migration[5.1]
  def change
  	  	add_reference :bookmarks, :link, index: true, foreign_key: true

  end
end
