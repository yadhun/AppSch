class AddScheduleLaterToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :schedule_later, :boolean
  end
end
