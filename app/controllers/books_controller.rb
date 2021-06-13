class BooksController < ApplicationController
  def index
    @books = Book.where(status: "購入済み").or(Book.where(status: ""))
                 .page(params[:page]).per(10).reverse_order
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: '書籍情報は正常に登録されました.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end     
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: '書籍情報は正常に更新されました.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy
    
    respond_to do |format|
      format.html { redirect_to books_url, notice: '書籍情報は正常に削除されました.' }
      format.json { head :no_content }
    end
  end

  private

    def set_book
      @book = Book.find(:params[:id])
    end

    def book_params
      params.require(:book)
      .permit(
              :title, :author, :image, :publisher, :published_at,
              :comment, :category, :isbn, :language,
              :price, :link, :regitrator, :reputation,
              :status, :summary
      ).merge(user_id: current_user.id)
    end
end
