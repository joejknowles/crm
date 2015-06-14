require 'rails_helper'

RSpec.describe Question, type: :model do
  it { is_expected.to belong_to :section }
  it { is_expected.to have_many :answers }
  it { is_expected.to have_db_column :question_text }
  it { is_expected.to have_db_column :question_key }
  it { is_expected.to have_db_column :current_maturity }
end
