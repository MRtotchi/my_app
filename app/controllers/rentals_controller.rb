class RentalsController < ApplicationController
  def borrow
    rental = Rental.new(book_id: params[:id], user_id: current_user.id)
    if rental.save
      redirect_to books_path, notice: "書籍の貸し出し処理を行いました"
    else
      redirect_to book_path, notice: "書籍の貸し出し処理に失敗しました"
    end
  end

  def return
    rental = Rental.find(params[:id])
    rental.update(returned: true)
    redirect_to books_path, notice: "書籍の返却処理を行いました"
  end

end
