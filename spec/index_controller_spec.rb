require_relative 'spec_helper'

describe "index controller" do
  it "responds with a successful status" do
    # Given
    # When
    get '/articles'
    # Then
    expect(last_response.status).to eq(200)
  end
end
