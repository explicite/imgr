require 'rubygems'
require 'RMagick'
require 'win32ole'

class Photo < ActiveRecord::Base
  attr_accessible :user_id, :image, :red, :green, :blue
  has_attached_file :image

  attr_accessor :flash_notice

  after_save :count_colors 

private
  def count_colors
		if !image.path.nil?
			self.flash_notice = image.path(:oryginal)
    	img = Magick::Image.read(ENV['userprofile']+image.path).first
    	total = 0
			avg   = { :r => 0.0, :g => 0.0, :b => 0.0 }
			img.quantize.color_histogram.each { |c, n|
			    avg[:r] += n * c.red
			    avg[:g] += n * c.green
			    avg[:b] += n * c.blue
			    total   += n
			}
			[:r, :g, :b].each { |comp| avg[comp] /= total }
				    
			photo = Photo.find(id)
			photo.update_column(:red, avg[:r])
			photo.update_column(:green, avg[:g])
			photo.update_column(:blue, avg[:b])
  	end
  end 
end