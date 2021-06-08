# == Schema Information
#
# Table name: books
#
#  id           :integer          not null, primary key
#  author       :string
#  comment      :text
#  group        :string
#  image        :string
#  isbn         :string
#  published_at :date
#  publisher    :string
#  registrator  :string
#  status       :string
#  summary      :text
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Book < ApplicationRecord
end
