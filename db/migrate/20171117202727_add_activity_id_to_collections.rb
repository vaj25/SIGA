class AddActivityIdToCollections < ActiveRecord::Migration[5.1]
  def change
    add_reference :collections, :activity, foreign_key: true
  end
end
