class CreateGirls < ActiveRecord::Migration
  def change
    create_table :girls do |t|

      t.timestamps
    end
  end
end
