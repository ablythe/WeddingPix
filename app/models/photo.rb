require 'open-uri'

class Photo < ActiveRecord::Base
  validates :insta_id, uniqueness: true

  after_create do 
    print_from_url
  end


  def print_from_url 
    binding.pry
    open('image.png', 'wb') do |file|
      file << open(insta_url).read
    end
    system('lpr', "image.png") or raise "lpr failed"
  end 


end
