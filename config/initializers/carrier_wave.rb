CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',      
    :aws_access_key_id      => 'AKIAI75TAQ2ZVCMVTVLQ',       
    :aws_secret_access_key  => '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'
  }
  config.fog_directory  = 'missioncreek-assets'                     # required
  config.fog_host       = 'http://localhost:3001'            # optional, defaults to nil
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end