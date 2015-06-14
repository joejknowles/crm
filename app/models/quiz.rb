class Quiz < ActiveRecord::Base
  belongs_to :client
  has_many :sections
  has_many :answers
end
