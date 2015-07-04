class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.belongs_to :department, index: true, foreign_key: true
      t.belongs_to :doctor, index: true, foreign_key: true
      t.date :date_of_appointment
      t.string :time_of_appointment

      t.timestamps null: false
    end
  end
end
