class Pokemon < ApplicationRecord
  belongs_to :generation
  validates :name, :numericality => { :greater_than_or_equal_to => 0 }
  validates :generation_id, :numericality => { :greater_than_or_equal_to => 0 }
end
