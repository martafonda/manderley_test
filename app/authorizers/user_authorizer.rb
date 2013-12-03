class UserAuthorizer < ApplicationAuthorizer
  def updatable_by?(user)
    user == resource || user.admin?
  end
end