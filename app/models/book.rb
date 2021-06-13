# == Schema Information
#
# Table name: books
#
#  id           :integer          not null, primary key
#  author       :string
#  category     :string
#  comment      :text
#  group        :string
#  image        :string
#  isbn         :string
#  language     :string
#  link         :string
#  price        :integer
#  published_at :date
#  publisher    :string
#  registrator  :string
#  reputation   :integer
#  status       :string
#  summary      :text
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Book < ApplicationRecord
end
