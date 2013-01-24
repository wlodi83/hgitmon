class AddPublishedColumnToGirls < ActiveRecord::Migration
  def change
    add_column :girls, :published, :boolean, :default => false
  end
end
