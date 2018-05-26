class RemovePersonIdFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :person_id, :integer
  end
end
