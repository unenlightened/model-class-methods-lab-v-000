class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    self.all
  end

  def self.longest
    longest_boat_length = Boat.order(length: :desc).limit(1).first.length
    self.joins(:boats).where(boats: {length: longest_boat_length})
  end
end
