require_relative 'spec_helper'

describe "index_controller" do
  before do
    Article.delete_all
  end

  describe "get /articles" do
    it "responds with a successful status" do
      # Given
      # setup the world that has to exist for the test to even do something
      # When
      get '/articles'
      # Then
      expect(last_response.status).to eq(200)
    end

    it "responds with at least an article" do
      # Given
      Article.create(title: "An article title")
      # When
      get '/articles'
      # Then
      expect(last_response.body).to include("An article title")
    end
  end

  describe "get /articles/:id" do
    
    it "responds with success" do
      # Given
      article = Article.create(title: "Another Article title")
      # When
      get "/articles/#{article.id}"
      # Then
      expect(last_response.status).to eq(200)
    end

    it "responds with Article data" do
      # Given
      article = Article.create(title: "Another Article title")
      # When
      get "/articles/#{article.id}"
      # Then
      expect(last_response.body).to include("Another Article title")
    end
  end

  describe "post /articles" do
    it "responds with a 200" do
      # Given
      # When
      post '/articles'
      # Then
      expect(last_response.status).to eq(200)
    end

    it "creates a new Article when a new article is submitted" do
      # Given
      article_length_before = Article.count
      # When
      expect {
        post '/articles', {title: "An article title"}
      }.to change { Article.count }.by(1)
    end
  end
end
