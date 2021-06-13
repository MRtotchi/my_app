class AddColumnToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :author, :string #著者名
    add_column :books, :comment, :text #コメント
    add_column :books, :image, :string #表紙画像
    add_column :books, :isbn, :string #ISBNコード
    add_column :books, :published_at, :date #発行年
    add_column :books, :publisher, :string #出版社
    add_column :books, :registrator, :string #書籍登録者
    add_column :books, :status, :string #未購入、発注済み、購入済み
    add_column :books, :summary, :text #概要
  
  end
end