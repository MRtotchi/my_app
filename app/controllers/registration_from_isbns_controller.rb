class RegistrationFromIsbnsController < ApplicationController
  def create
    response = GoogleBooksApiService.new.execute(params[:isbn])

    return redirect_to new_isbn_path, notice: "ISBNコードから書籍データが取得できませんでした.お手数ですが手入力で登録してください" if responce["totalItems"] == 0
    title = response["Items"][0]["volumeInfo"]["title"]

    if response["Items"][0]["volumeInfo"]["authors"]
      author = response["Items"][0]["volumeInfo"]["authors"][0]
    else
      author = nil
    end

    if response["Items"][0]["volumeInfo"]["imageLinks"]
      image = response["Items"][0]["volumeInfo"]["imageLinks"]["smallThumbnail"]
    else
      image = nil
    end

    if response["Items"][0]["volumeInfo"]["publisher"]
      publisher = response["Items"][0]["volumeInfo"]["publisher"]
    else
      publisher = nil
    end

    if response["Items"][0]["volumeInfo"]["publishedDate"]
      pubilished_at = response["Items"][0]["volumeInfo"]["publishedDate"]
    else
      published_at = nil
    end

    if response["Items"][0]["volumeInfo"]["industryIdentifiers"][1]["identifier"]
      isbn = response["Items"][0]["volumeInfo"]["industryIdentifiers"][1]["identifier"]
    else 
      isbn = nil
    end

    if response["Items"][0]["volumeInfo"]["description"]
      summary = response["Items"][0]["volumeInfo"]["description"]
    else
      summary = nil
    end

    @book = Book.new(
                      title: title
                      author: author
                      publisher: pubilisher
                      published_at: published_at
                      isbn: isbn
                      summary: summary
                     )
      if @book.save
        redirect_to new_isbn_path(@book), notice :'書籍情報が正しく登録されました'
      else
        redirect_to new_isbn_path, notice: '同一の書籍が既に登録されています'
      end
      
    
  end
end
