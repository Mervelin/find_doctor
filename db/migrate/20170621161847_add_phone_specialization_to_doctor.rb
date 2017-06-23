class AddPhoneSpecializationToDoctor < ActiveRecord::Migration[5.0]
  def up
    add_column :doctors, :phone, :string
    add_column :doctors, :specialization, :string
  end

  def down
    remove_column :doctors, :phone
    remove_column :doctors, :specialization
  end
end
