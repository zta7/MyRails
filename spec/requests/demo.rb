require "rails_helper"
describe "demo for requests get" do
  it 'should return correct response via GET' do
    gets 'api/demo'
  end
end
