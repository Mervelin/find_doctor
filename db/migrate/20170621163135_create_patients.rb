class CreatePatients < ActiveRecord::Migration[5.0]
  def up
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end

  def down
    drop_table :patients
  end
end
