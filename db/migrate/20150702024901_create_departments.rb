class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.time :morning_opens_at
      t.time :evening_opens_at

      t.timestamps null: false
    end
  end
end
