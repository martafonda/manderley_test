class Movie < ActiveRecord::Base
  paginates_per 21
  extend FriendlyId
  friendly_id :title, :use => :slugged
  class << self
    def role_relation role
      has_many role.pluralize.to_sym, -> { where(casts: {role: role})} , through: :casts, source: :person 
    end
  end

  def to_key
    [slug]
  end

  has_many :comments , dependent: :destroy
  has_many :casts, dependent: :destroy
  accepts_nested_attributes_for :casts, allow_destroy: true, reject_if: :all_blank
  has_many :people, through: :casts

  serialize :categories
  before_save :reject_categories
  CATEGORIES = ["Action", "Drama", "Comedy", "Horror"]
  def reject_categories
    self.categories = self.categories.find_all{|x| x.present?}
  end

  role_relation 'director'
  role_relation 'actor'
  role_relation 'technician'
  role_relation 'writer'
  role_relation 'productor'

  belongs_to :user

  validates_presence_of :title, :year, :duration
  scope :directed_by, ->(person) { joins(:casts).where(casts: {role: :director, person_id: person.id}) }
  scope :short, -> { where('duration < ?', 60) }
  scope :longer_that, ->(duration) {  where('duration > ?',duration) }
  scope :medium, -> { longer_that 60 }
  scope :long, -> { longer_that 90 }
  scope :huge, -> { longer_that 120 }
  scope :nineties, -> { where('? < year < ?', 1989, 2000) }
  scope :modern, -> { where('year > ?', 2000) }
  scope :gorgeous, -> { self.modern.long }

end

