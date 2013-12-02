class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :email_for_slug, :use => :slugged

  def email_for_slug
    email.gsub('@', ' AT ').gsub('.', ' DOT ')
  end
  
  devise :database_authenticatable, :registerable, :recoverable
  has_many :movies
end
