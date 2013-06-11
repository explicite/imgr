require 'rubygems'
require 'RMagick'
require 'win32ole'

class Photo < ActiveRecord::Base
  attr_accessible :user_id, :image, :color
  has_attached_file :image, :styles => { :thumb => "100x100>" }
  self.per_page = 10
  attr_accessor :flash_notice

	validates :image, :attachment_presence => true
	validates_attachment_content_type :image, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/, :message => 'file type is not allowed (only jpeg/png/gif images)'

  after_save :count_colors 

private
  def count_colors
		if !image.path.nil?
    	img = Magick::Image.read(image.path).first
    	test_img = img.scale(4, 4)
			photo = Photo.find(id)
			photo.update_column(:color, (test_img.pixel_color(0,0).red*65536)+(test_img.pixel_color(0,0).green*256)+test_img.pixel_color(0,0).blue+(test_img.pixel_color(0,1).red*65536)+(test_img.pixel_color(0,1).green*256)+test_img.pixel_color(0,1).blue+(test_img.pixel_color(1,0).red*65536)+(test_img.pixel_color(1,0).green*256)+test_img.pixel_color(1,0).blue+(test_img.pixel_color(1,1).red*65536)+(test_img.pixel_color(1,1).green*256)+test_img.pixel_color(1,1).blue)
  	end
  end 
end