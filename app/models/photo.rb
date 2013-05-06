class Photo < ActiveRecord::Base
  attr_accessible :user_id, :image
  has_attached_file :image
end
