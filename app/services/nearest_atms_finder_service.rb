class NearestAtmsFinderService < BaseService
  EARTH_RADIUS_KM = 6373
  CACHE = {}

  attribute :location, Array
  attribute :use_cash, Boolean, default: true
  attribute :cache_used, Boolean

  class << self
    def clear_cache
      CACHE.clear
    end
  end

  def call
    return [] unless location&.size == 2
    if use_cash && CACHE.has_key?(location)
      self.cache_used = true
      CACHE[location]
    else
      self.cache_used = false
      CACHE[location] = get_5_nearest_atms(location)
    end
  end

  private

  def get_5_nearest_atms(location)
    location_lat = location[0]
    location_lon = location[1]

    Atm.find_by_sql <<-SQL.squish
      SELECT ranked_atms.*
        FROM (
          SELECT atms.*,
                 rank() OVER(
                    ORDER BY 1000 * 2 * #{EARTH_RADIUS_KM} * 
                             asin(
                               sqrt(
                                  (sin(radians((#{location_lat} - atms.lat) / 2))) ^ 2 +
                                  cos(radians(atms.lat)) * 
                                  cos(radians(#{location_lat})) * 
                                  (sin(radians((#{location_lon} - atms.lon) / 2))) ^ 2
                               )
                             )
                 )
            FROM atms
             ) ranked_atms
       WHERE rank <= 5
    SQL
  end
end