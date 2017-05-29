require 'open-uri'

class Photo < ActiveRecord::Base
  validates :insta_id, uniqueness: true

  after_create do
    save_to_computer
    overlay 
    print
  end

  def save_to_computer
    open("#{insta_id}.png", 'wb') do |file|
      file << open(insta_url).read
    end
  end

  def print
    system('lpr', "-o fit-to-page", "#{insta_id}.png") or raise "lpr failed"
  end

  def overlay
    base = Magick::Image.read("#{insta_id}.png").first
    resized = base.resize_to_fill(580)
    template = Magick::Image.read("template.png").first
    template.composite!(resized, 10, 10, Magick::OverCompositeOp)
    template.write("#{insta_id}.png")
  end


end
