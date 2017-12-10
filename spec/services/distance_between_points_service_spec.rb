require 'rails_helper'

RSpec.describe DistanceBetweenPointsService do
  it 'distance between two points' do
    point1 = [55.853763, 37.471331]
    point2 = [55.843261, 37.478541]

    expect(DistanceBetweenPointsService.new(point1: point1, point2: point2).call).to be_within(2).of(1252)
  end
end