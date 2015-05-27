require "open-uri"

class Photo 
  def print_image_from_url url 
    open('image.png', 'wb') do |file|
      file << open(url).read
    end
    system('lpr', "image.png") or raise "lpr failed"
  end 
end