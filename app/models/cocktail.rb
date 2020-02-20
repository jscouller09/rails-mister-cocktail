class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :pic_url,
            format: { with: URI::regexp,
                      message: "Valid URL required" }
end
