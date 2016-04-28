class Menu < ActiveRecord::Base
  paginates_per 5
  mount_uploader :image, ImageUploader

  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'line items present')
      return false
    end
  end

end
