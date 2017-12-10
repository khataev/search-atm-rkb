require 'rails_helper'

RSpec.describe NearestAtmsFinderService do

  it 'finds 5 nearest atms' do
    location = [55.855610, 37.475795] # Речной вокзал северный выход

    atm_f11 = create :atm_f11 # Фестивальная 11
    atm_f7 = create :atm_f7 # Фестивальная 7
    atm_f5 = create :atm_f5 # Фестивальная 5
    atm_f3 = create :atm_f3 # Фестивальная 3
    atm_f1 = create :atm_f1 # Фестивальная 1
    atm_f7a = create :atm_f7a # Фестивальная 7A

    result = NearestAtmsFinderService.new(location: location).call
    expect(result).to match_array [atm_f11, atm_f7, atm_f5, atm_f3, atm_f7a]

    # second hit should
  end

  it 'caches previous results' do
    location = [55.855610, 37.475795] # Речной вокзал северный выход
    new_location = [55.855610, 37.475796]
    NearestAtmsFinderService.clear_cache

    # first time - hits DB
    srv = NearestAtmsFinderService.new(location: location)
    expect(srv).to receive(:get_5_nearest_atms).with(location)
    srv.call

    # second - does not
    srv = NearestAtmsFinderService.new(location: location)
    expect(srv).to_not receive(:get_5_nearest_atms)
    srv.call

    # new location - hits
    srv = NearestAtmsFinderService.new(location: new_location)
    expect(srv).to receive(:get_5_nearest_atms)
    srv.call
  end

end