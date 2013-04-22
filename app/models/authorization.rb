class Authorization < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id
  belongs_to :user
  validates_presence_of :user_id, :uid, :provider, presence: true
end
