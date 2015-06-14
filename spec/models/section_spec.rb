require 'rails_helper'

RSpec.describe Section, type: :model do
  it { is_expected.to belong_to :quiz }
  it { is_expected.to have_many :questions }
end
