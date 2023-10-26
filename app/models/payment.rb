class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :author_id, presence: true
  validates :category_id, presence: true
end
