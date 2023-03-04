class Ufo < ApplicationRecord
  has_many :sightings
  has_rich_text :description

  enum statuses: %w[ Active Inactive Decommissioned ]
end
