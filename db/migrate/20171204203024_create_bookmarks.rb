class CreateBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks do |t|
      	t.string :bookmark_name
  		t.timestamps	
    end
  end
end
