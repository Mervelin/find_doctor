class AlterVisits < ActiveRecord::Migration[5.0]
  def up
    remove_column('visits', 'start_time')
    remove_column('visits', 'end_time')
    add_column('visits', 'start_time', :datetime)
    add_column('visits', 'end_time', :datetime)
  end

  def down
    remove_column('visits', 'start_time')
    remove_column('visits', 'end_time')
    add_column('visits', 'start_time', :time)
    add_column('visits', 'end_time', :time)
  end
end
