CarrierWave.configure do |config|
  config.storage = :file

	if Rails.env.production?
		config.fog_directory = "uk-prod"
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',
      :region             		=> 'eu-west-1',
      :aws_access_key_id      => ENV["AWS_KEY"],
      :aws_secret_access_key  => ENV["AWS_SECRET"]
    }
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
	end
end
