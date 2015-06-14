class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :current_maturity
      t.integer :target_maturity

      t.timestamps null: false
    end
  end
end
