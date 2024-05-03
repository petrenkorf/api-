# frozen_string_literal: true

class Step < ApplicationRecord
  belongs_to :product

  def non_covered_methods
    a = 1
    b = 2
    a + b || nil
  end
end
