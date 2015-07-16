class InstagramDataParser

  def initialize data 
    @data = data 
  end

  def get_data_for_photo 
    parsed_data = data['data'].map {|x| {id: x['id'], link: x['images']['standard_resolution']['url']}}
    return parsed_data
  end

  protected

  attr_reader :data
end