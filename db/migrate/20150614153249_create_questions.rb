class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question_key
      t.text :question_text
      t.integer :current_maturity
      t.text :target_maturity
      t.text :immature_description
      t.text :mature_description

      t.timestamps null: false
    end
  end
end
