require "cashier_cotendo/version"

module CashierCotendo
  def self.on_cache_write(key)
    
  end

  def self.base_url
    @@base_url ||= ""
  end

  def self.base_url=(url)
    @@base_url = url
  end
end
