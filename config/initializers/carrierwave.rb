CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => Figaro.env.s3_access,
    :aws_secret_access_key  => Figaro.env.s3_secret,
    # :region                 => 'us-west-1'
  }
  config.fog_directory  = Figaro.env.s3_bucket
end
