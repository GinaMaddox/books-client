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

  def new
    render "new.html.erb"
  end

  def create
    response = Unirest.post("localhost:3000/api/books",
      parameters: {
        title: params[:title] ,
        author: params[:author],
        publisher: params[:publisher] ,
        genre: params[:genre]
      })
    @book = response.body
    render "show.html.erb"
  end
 
  def edit
    book_id = params[:id]
    response = Unirest.get("localhost:3000/api/books/#{book_id}")
    @book = response.body
    render "edit.html.erb"
  end

  def update
    book_id = params[:id]
    response = Unirest.patch("localhost:3000/api/books/#{book_id}", parameters: {
        title: params[:title] ,
        author: params[:author],
        publisher: params[:publisher] ,
        genre: params[:genre]
    })
    @book = response.body
    render "show.html.erb"
  end

  def destroy
    book_id = params[:id]
    response = Unirest.delete("localhost:3000/api/books/#{book_id}")
    render "destroy.html.erb"
  end
end
