# frozen_string_literal: true

class Product < ApplicationRecord
  include Discard::Model

  validates :pos_code, uniqueness: true
  validates :name, length: { maximum: 100 }

  def disabled? = disabled_at.present?

  def something
    a = 1
    b = 1
    b + a
  end
end
