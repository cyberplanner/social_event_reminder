require 'rails_helper'

RSpec.describe Event, type: :model do

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:date) }
  it { should belong_to(:user) }

  it 'is not valid without a title' do
    event = Event.new(date: '2017-12-31')
    expect(event).to have(1).error_on(:title)
    expect(event).not_to be_valid
  end


end
