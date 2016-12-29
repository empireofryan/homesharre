class Room < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :reservations
  has_many :reviews

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :home_type, :room_type, :accomodate, :bed_room, :bath_room, :listing_name, :summary, :address, presence: true
  validates :listing_name, :summary, length: {maximum: 500}

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:star).round(2) rescue nil
  end
end
