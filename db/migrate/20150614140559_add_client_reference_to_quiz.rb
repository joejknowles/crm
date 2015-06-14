class AddClientReferenceToQuiz < ActiveRecord::Migration
  def change
    add_reference :quizzes, :client, index: true, foreign_key: true
  end
end
