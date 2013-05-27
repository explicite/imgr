class AddBlueToPhotos < ActiveRecord::Migration
  def change
  	add_column :photos, :blue, :integer
  end
end
