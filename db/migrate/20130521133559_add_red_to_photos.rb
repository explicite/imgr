class AddRedToPhotos < ActiveRecord::Migration
  def change
  	add_column :photos, :red, :integer
  end
end
