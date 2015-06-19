AWS.config(access_key_id:     Figaro.env.s3_access,
           secret_access_key: Figaro.env.s3_secret)

S3_BUCKET = AWS::S3.new.buckets[Figaro.env.s3_bucket]
