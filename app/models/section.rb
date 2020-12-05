class Section < ApplicationRecord
  belongs_to :playlist
  has_many :videos
end
