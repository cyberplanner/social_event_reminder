class AddEventRefToReminder < ActiveRecord::Migration
  def change
    add_reference :reminders, :event, index: true, foreign_key: true
  end
end
