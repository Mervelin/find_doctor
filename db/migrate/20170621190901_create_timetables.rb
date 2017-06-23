class CreateTimetables < ActiveRecord::Migration[5.0]
  def up
    create_table :timetables do |t|
      t.integer 'doctor_id'
      t.integer 'office_id'
      t.datetime 'start_time'
      t.datetime 'end_time'
      t.integer 'day_of_week'

      t.timestamps
    end

    add_index('timetables', %w[doctor_id office_id])
  end

  def down
    drop_table :timetables
  end
end
