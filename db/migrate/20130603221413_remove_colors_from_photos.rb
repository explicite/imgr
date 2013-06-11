class RemoveColorsFromPhotos < ActiveRecord::Migration
  def up
  	remove_column :photos, :red
  	remove_column :photos, :blue
  	remove_column :photos, :green
  end

  def down
  end
end
