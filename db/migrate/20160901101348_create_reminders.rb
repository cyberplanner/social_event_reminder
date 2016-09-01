class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :name
      t.string :phone_number
      t.datetime :time
      t.date :date

      t.timestamps null: false
    end
  end
end
