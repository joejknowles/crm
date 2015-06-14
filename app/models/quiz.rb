class Quiz < ActiveRecord::Base
  belongs_to :client
  has_many :sections
  has_many :answers
  def average_for section
    section = Section.where(name: section)
    question = Question.where(section: section)
    section_answers = answers.where(question: question)
    section_length = section_answers.length
    section_answers.inject(0) do |memory, answer|
      memory += (answer.current_maturity.to_f / section_length)
      memory
    end
  end
end
