require 'rails_helper'

RSpec.describe Atm, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :lat }
  it { should validate_presence_of :lon }
  it { should validate_numericality_of(:lat).is_greater_than_or_equal_to(-90).is_less_than_or_equal_to(90) }
  it { should validate_numericality_of(:lon).is_greater_than_or_equal_to(-180).is_less_than_or_equal_to(180) }
end