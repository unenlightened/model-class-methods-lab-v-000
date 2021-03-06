class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five
    self.limit(5)
  end

  def self.dinghy
    self.where("length <?",  20)
  end

  def self.ship
    self.where("length >=?", 20)
  end

  def self.last_three_alphabetically
    self.order(name: :desc).limit(3)
  end

  def self.without_a_captain
    self.where(captain: nil)
  end

 #join?
  def self.sailboats
    self.joins(:classifications).where(classifications: {name: 'Sailboat'})
  end

#really fancy join hmmm, how do to find count?
  def self.with_three_classifications
      self.joins(:classifications).group('boats.id').having('count(boat_id) = 3')
  end
end
