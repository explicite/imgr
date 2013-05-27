class AddGreenToPhotos < ActiveRecord::Migration
  def change
  	add_column :photos, :green, :integer
  end
end
