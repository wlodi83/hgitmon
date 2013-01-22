class AddFieldsToGirls < ActiveRecord::Migration
  def change
    add_column :girls, :title, :string
    add_column :girls, :description, :text
  end
end
