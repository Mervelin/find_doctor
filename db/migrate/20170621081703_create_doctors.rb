class CreateDoctors < ActiveRecord::Migration[5.0]
  def up
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :email
      t.text :description

      t.timestamps
    end
  end

  def down
    drop_table(:doctors)
  end
end
