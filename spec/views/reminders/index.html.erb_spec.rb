require 'rails_helper'

RSpec.describe "reminders/index", type: :view do
  before(:each) do
    assign(:reminders, [
      Reminder.create!(
        :name => "Name",
        :phone_number => "Phone Number"
      ),
      Reminder.create!(
        :name => "Name",
        :phone_number => "Phone Number"
      )
    ])
  end

  it "renders a list of reminders" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
  end
end
