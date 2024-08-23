class BooksController < ApplicationController
   # Mostrar todos los libros
   def index
    books = Book.all
    render json: books
  end

  # Mostrar un libro específico
  def show
    book = Book.find(params[:id])
    render json: book
  end

  # Crear un nuevo libro
  def create
    book = Book.new(book_params)
    if book.save
      render json: book, status: :created
    else
      render json: book.errors, status: :unprocessable_entity
    end
  end

  # Actualizar un libro existente
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      render json: book
    else
      render json: book.errors, status: :unprocessable_entity
    end
  end

  # Eliminar un libro
  def destroy
    book = Book.find(params[:id])
    book.destroy
    head :no_content
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end
end
