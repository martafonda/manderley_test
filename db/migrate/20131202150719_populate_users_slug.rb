class PopulateUsersSlug < ActiveRecord::Migration
  def change
    User.find_each &:save
  end
end
