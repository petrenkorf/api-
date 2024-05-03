# frozen_string_literal: true

class Product < ApplicationRecord
  include Discard::Model

  validates :pos_code, uniqueness: true
  validates :name, length: { minimum: 1, maximum: 100 }

  def disabled? = disabled_at.present?
end
