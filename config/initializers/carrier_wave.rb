CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',      
    :aws_access_key_id      => ENV['S3_KEY'],
    :aws_secret_access_key  => ENV['S3_SECRET']
  }
  config.fog_directory  = 'missioncreek-assets'                     # required
  config.asset_host       = 'http://localhost:3001'            # optional, defaults to nil
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
