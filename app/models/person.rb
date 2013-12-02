class Person < ActiveRecord::Base
  extend FriendlyId
  friendly_id :complete_name, :use => :slugged
  has_many :casts, dependent: :destroy
  has_many :movies, through: :casts
  has_many :directed, -> { where(casts: {role: 'director'}) } , through: :casts, source: :movie
  validates_presence_of :name, :surname

  def complete_name
    "#{self.name} #{self.surname}"
  end
end
