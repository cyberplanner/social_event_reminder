class AddPostcodeToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :postcode, :string
  end
end
