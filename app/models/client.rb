class Client < ActiveRecord::Base
  has_many :quizs
  def average_for section
    quizs.first.average_for section
  end
end
