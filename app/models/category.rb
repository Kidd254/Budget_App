class Category < ApplicationRecord
  belongs_to :author
  has_many :payments
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
