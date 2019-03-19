if Rails.env=="production"
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY'],
      aws_secret_access_key: ENV['AWS_SECRET_KEY'],
      region: ENV['AWS_REGION']
    }
  
    config.fog_directory  = ENV['AWS_BUCKET']
    config.cache_storage = :fog
  end
end