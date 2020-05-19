class Album < ApplicationRecord

  validates :band_id, presence: true
  validates :title, presence: true
  validates :year, presence: true
  validates :is_live, presence: true

  belongs_to :band
  
end
