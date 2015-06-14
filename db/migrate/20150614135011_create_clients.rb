class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :company_name
      t.string :email
      t.string :sector
      t.string :size
      t.boolean :can_contact

      t.timestamps null: false
    end
  end
end
