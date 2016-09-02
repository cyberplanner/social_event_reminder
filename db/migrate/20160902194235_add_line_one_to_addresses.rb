class AddLineOneToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :line_one, :string
  end
end
