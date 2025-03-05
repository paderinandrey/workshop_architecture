# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    books = Book.page(page).per(Settings.app.items_per_page)
    render json: BookSerializer.new(books).serialize
  end

  private

  def page
    [ params[:page].to_i, 1 ].max
  end
end
