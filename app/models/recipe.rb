class Recipe < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :foods, through: :ingredients
  has_many :notes, through: :bookmarks

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :instructions, presence: true
  validates :serves, presence: true
  validates :cook_time, presence: true
<<<<<<< HEAD
  has_one_attached :photo
  has_many_attached :images
=======

  include PgSearch::Model
  pg_search_scope :search_by_food,
                  associated_against: { foods: :name },
                  using: { tsearch: { prefix: true } }

  has_many_attached :photos

>>>>>>> master
end
