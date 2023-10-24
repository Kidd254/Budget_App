class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :payments
  validates :name, presence: true, uniqueness: { message: 'Category with this name already exists' }
  validates :icon, presence: true, uniqueness: true

  def self.available_icons
    Dir.glob('app/assets/images/category_icons/*').map do |icon_path|
      File.basename(icon_path)
    end
  end
end
