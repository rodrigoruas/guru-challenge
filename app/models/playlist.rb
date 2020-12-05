class Playlist < ApplicationRecord
  has_many :sections
  validates :name, :description, presence: true
end
