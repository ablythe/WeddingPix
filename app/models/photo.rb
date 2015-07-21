require 'open-uri'

class Photo < ActiveRecord::Base
  validates :insta_id, uniqueness: true

  after_create do 
    print_from_url
  end


  def print_from_url 
    open("#{insta_id}.png", 'wb') do |file|
      file << open(insta_url).read
    end
    system('lpr', "#{insta_id}.png") or raise "lpr failed"
  end 

  def overlay
    base = Magick::Image.read("#{insta_id}.png").first
    overlay = Magick::Image.read("h&d.png").first
    base.composite!(overlay, 0, 0, Magick::OverCompositeOp)
    base.write("#{insta_id}.png")
  end


end
