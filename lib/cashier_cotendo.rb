require "cashier_cotendo/version"

module CashierCotendo
  PREFIX = "_cot_"

  def self.get_prefixed_key(key)
    "#{PREFIX}::#{key}"
  end

  def self.on_cache_write(key)
    redis.set(get_prefixed_key(key), base_url)
  end

  def self.base_url
    @@base_url ||= ""
  end

  def self.base_url=(url)
    @@base_url = url
  end

  def self.redis=(redis)
    @@redis = redis
  end

  def self.redis
    @@redis
  end
  
end