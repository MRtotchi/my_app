class SearchesController < ApplicationController
  before_action :set_q, only:[:index, :search]

  def index
    @q = Book.ransack(:q)
    @books = @q.result(distinct: true).page(params[:page]).per(10).reverse_order
  end

  def search
    @q = Book.search(search_params)
    @books = @q.result(distinct: true)
  end

  private
  def search_params
    params.reqire(:q).permit!(
                              :title_cont,
                              :authore_cont,
                              :punlisher_cont,
                              :isbn_cont,
                              :summary_cont
                             )
  end
end
