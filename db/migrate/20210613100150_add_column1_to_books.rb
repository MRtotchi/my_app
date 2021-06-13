class AddColumn1ToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :price, :integer #価格
    add_column :books, :category, :string #カテゴリ(AI、機械学習,RoR、etc)
    add_column :books, :reputation, :integer #評価値
    add_column :books, :language, :string #言語
    add_column :books, :link, :string #本の購入リンクURL
  end
end
