class DistanceBetweenPointsService < BaseService
  EARTH_RADIUS_KM = 6373

  attribute :point1, Array
  attribute :point2, Array

  # Сделал через обращение к БД, в качестве экономии времени и для использования уже работающего правильно кода.
  # Сделаем предположение, что этот сервис выполняется на сервере приложений и к "дорогим" ресурсам не обращается ;)
  def call
    return nil unless point1&.size == 2 && point2&.size == 2
    lat1, lat2 = point1[0], point2[0]
    lon1, lon2 = point1[1], point2[1]

    result = ActiveRecord::Base.connection.execute <<-SQL.squish
        SELECT 1000 * 2 * #{EARTH_RADIUS_KM} * asin(sqrt((sin(radians((#{lat2} - #{lat1}) / 2))) ^ 2 + cos(radians(#{lat1})) * cos(radians(#{lat2})) * (sin(radians((#{lon2} - #{lon1}) / 2))) ^ 2)) as distance
    SQL

    result.first["distance"]
  end

end