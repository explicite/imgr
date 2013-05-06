class AddPhotoToComment < ActiveRecord::Migration
  def change
  	add_column :comments, :photo_id, :integer
  	add_index :comments, :photo_id
  end
end
