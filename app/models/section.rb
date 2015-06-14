class Section < ActiveRecord::Base
  belongs_to :quiz
  has_many :questions
end
