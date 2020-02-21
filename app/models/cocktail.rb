class Cocktail < ApplicationRecord
  has_one_attached :photo
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :pic_url,
            allow_blank: true,
            format: { with: URI::regexp,
                      message: "Valid URL required" }
end
