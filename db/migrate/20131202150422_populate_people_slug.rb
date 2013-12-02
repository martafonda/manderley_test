class PopulatePeopleSlug < ActiveRecord::Migration
  def change
    Person.find_each &:save
  end
end
