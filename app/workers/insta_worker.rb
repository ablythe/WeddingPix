class InstaWorker

  include Sidekiq::Worker 
  include Sidetiq::Schedulable

  recurrence {minutely}

  def perform
    data = HTTParty.get("https://api.instagram.com/v1/tags/happy/media/recent?access_token=#{ENV['instagram_access_token']}")
    photo_data = InstagramDataParser.new(data).get_data_for_photo
    photo_data.map {|p| Photo.find_or_create_by(
      insta_id: p[:id], 
      insta_url: p[:link]
      )}
  end

end
