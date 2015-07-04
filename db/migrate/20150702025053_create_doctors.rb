class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :available_on
      t.belongs_to :department, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
