require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'Event is invalid if no title is given' do
    event = Event.new(title: nil)
    expect(event).to_not be_valid
  end
  it 'Event is invalid if title has less than 5 characters' do
    event = Event.new(title: 'Test')
    expect(event).to_not be_valid
  end
  it 'Event is invalid if no description is given' do
    event = Event.new(description: nil)
    expect(event).to_not be_valid
  end
  it 'Event is invalid if title has less than 10 characters' do
    event = Event.new(description: 'Test')
    expect(event).to_not be_valid
  end
  it 'Event is invalid if no date is given' do
    event = Event.new(date: nil)
    expect(event).to_not be_valid
  end
end
