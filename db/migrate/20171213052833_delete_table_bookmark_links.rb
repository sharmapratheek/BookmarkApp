class DeleteTableBookmarkLinks < ActiveRecord::Migration[5.1]
  def change
    drop_table :bookmark_links

  end
end
