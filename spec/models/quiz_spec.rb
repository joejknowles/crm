require 'rails_helper'

RSpec.describe Quiz, type: :model do
  it { is_expected.to belong_to :client }
  it { is_expected.to have_many :answers }
end
