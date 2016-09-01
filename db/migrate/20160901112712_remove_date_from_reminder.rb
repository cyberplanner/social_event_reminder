class RemoveDateFromReminder < ActiveRecord::Migration
  def change
    remove_column :reminders, :date, :date
  end
end
