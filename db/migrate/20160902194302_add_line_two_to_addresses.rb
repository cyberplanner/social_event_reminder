class AddLineTwoToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :line_two, :string
  end
end
