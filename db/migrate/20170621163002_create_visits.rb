class CreateVisits < ActiveRecord::Migration[5.0]
  def up
    create_table :visits do |t|

      t.integer 'doctor_id'
      t.integer 'patient_id'
      t.integer 'office_id'
      t.time 'start_time'
      t.time 'end_time'

      t.timestamps
    end
    add_index('visits', %w[doctor_id patient_id office_id])
  end

  def down
    drop_table :visits
  end
end
