class CreateOffices < ActiveRecord::Migration[5.0]
  def up
    create_table :offices do |t|
      t.integer 'doctor_id'
      t.string 'city'
      t.string 'postal_code'
      t.string 'street'
      t.string 'nr'
      t.text 'info'

      t.timestamps
    end
  end

  def down
    drop_table :offices
  end
end
