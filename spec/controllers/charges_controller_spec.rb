require 'rails_helper'

RSpec.describe ChargesController, :type => :controller do
  it "should return a blank instance" do
    expect(Hash.new).to eq({})
  end
end
