CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     '',                        # required
      aws_secret_access_key: '',                        # required
      region:                '',                  # optional, defaults to 'us-east-1'
      host:                  '',             # optional, defaults to nil
      endpoint:              '' # optional, defaults to nil
  }
  config.fog_directory  = ''                          # required
  config.fog_public     = true                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end