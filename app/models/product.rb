class Product < ApplicationRecord
  validates :pos_code, uniqueness: true

  def disabled? = disabled_at.present?
end
