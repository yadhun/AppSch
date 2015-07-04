class RemoveDateOfBirthFromUser < ActiveRecord::Migration
  def change
    remove_column :users ,:date_of_birth ,:string
    add_column :users, :date_of_birth, :date

  end
end
