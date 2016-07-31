class Room < ActiveRecord::Base
  belongs_to :user
  has_many :photos

  validates :home_type, :room_type, :accomodate, :bed_room, :bath_room, :listing_name, :summary, :address, presence: true
  validates :listing_name, :summary, length: {maximum: 500}

end
