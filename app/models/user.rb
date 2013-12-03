class User < ActiveRecord::Base
  include Authority::Abilities
  include Authority::UserAbilities
  rolify
  
  extend FriendlyId
  friendly_id :email_for_slug, :use => :slugged

  def email_for_slug
    email.gsub('@', ' AT ').gsub('.', ' DOT ')
  end
  
  devise :database_authenticatable, :registerable, :recoverable
  has_many :movies

  def admin
    self.has_role? :admin
  end
  alias_method :admin?, :admin

  def admin= value
    if value == "1"
      self.add_role :admin
    else
      self.remove_role :admin
    end
  end
end
