class Playlist < ApplicationRecord
  has_many :sections
  enum min_subscription: [:basic, :premium, :professional]
  validates :name, :description, presence: true
end
