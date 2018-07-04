class Client::BooksController < ApplicationController
  def index
    response = Unirest.get("localhost:3000/api/books")
    @books = response.body
    render "index.html.erb"
  end

  def show
    book_id = params[:id]
    response = Unirest.get("localhost:3000/api/books/#{book_id}")
    @book = response.body
    render "show.html.erb"
  end

end
