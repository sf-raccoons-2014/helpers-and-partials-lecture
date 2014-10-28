require_relative 'spec_helper'

describe "index controller" do
  it "responds with a successful status" do
    # Given
    # When
    get '/articles'
    # Then
    expect(last_response.status).to eq(200)
  end

  it "responds with articles that are in the database" do
    # Given
    article = Article.create(title: "An Article Title")
    # When
    get '/articles'
    # Then
    expect(last_response.body).to include("An Article Title")
  end
end
