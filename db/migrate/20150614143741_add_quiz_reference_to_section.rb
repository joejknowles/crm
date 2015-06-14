class AddQuizReferenceToSection < ActiveRecord::Migration
  def change
    add_reference :sections, :quiz, index: true, foreign_key: true
  end
end
