class AddSectionReferenceToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :section, index: true, foreign_key: true
  end
end
