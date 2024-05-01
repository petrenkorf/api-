class Product < ApplicationRecord
  include Discard::Model

  validates :pos_code, uniqueness: true
  validates :name, length: {maximum: 100}

  def disabled? = disabled_at.present?
end
