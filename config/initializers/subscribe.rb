ActiveSupport::Notifications.subscribe :atm_saved do |name, start_time, end_time, id, payload|
  NearestAtmsFinderService.handle_change(payload[:lat], payload[:lon])
end