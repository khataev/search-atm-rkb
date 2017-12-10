class Atm < ApplicationRecord
  validates :name, presence: true
  validates :lat, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :lon, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  after_create :invalidate_atms_cache
  after_destroy :invalidate_atms_cache

  private

  def invalidate_atms_cache
    Rails.logger.debug "invalidate_atms_cache. id: #{id}, lat: #{lat}, lon: #{lon}"
    ActiveSupport::Notifications.instrument(:atm_saved, lat: lat, lon: lon)
  end
end
