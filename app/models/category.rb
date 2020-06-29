class Category < ApplicationRecord
  validates :name, presence: true, length: {maximum: 19, minimum: 5}
  validates_uniqueness_of :name
  has_many :article_categories
  has_many :articles, through: :article_categories

end