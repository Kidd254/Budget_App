class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :payments
  validates :description, presence: true
  validate :unique_name_and_icon_within_user
  before_create :set_description_once

  def self.available_icons
    Dir.glob('app/assets/images/category_icons/*').map do |icon_path|
      File.basename(icon_path)
    end
  end

  def set_description_once
    self.description = 'Default description' if description.blank?
  end

  # rubocop:disable Style/HashSyntax
  def unique_name_and_icon_within_user
    existing_categories = Category.where(author_id: author_id, name: name, icon: icon)
    return unless existing_categories.any? && existing_categories.first != self

    errors.add(:name, 'has already been taken for this user')
    errors.add(:icon, 'has already been taken for this user')
  end
  # rubocop:enable Style/HashSyntax

  private

  def set_description_once
    self.description = 'Default description' if description.blank?
  end

  def unique_name_and_icon_within_user
    existing_categories = Category.where(author_id: author_id, name: name, icon: icon)
    return unless existing_categories.any? && existing_categories.first != self

    errors.add(:name, 'has already been taken for this user')
    errors.add(:icon, 'has already been taken for this user')
  end
end
