require 'redis'

rc = LINKSTORE_CONFIG[:redis]
REDIS = Redis.new(host: rc[:host], port: rc[:port], password: rc[:auth])
module LinkStoreDevelopment

  def link(key)
    REDIS.get(key)
  end

  def shorten(key, link)
    REDIS.set key, link
  end
end