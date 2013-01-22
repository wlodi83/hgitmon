class AddAttachmentImageToGirls < ActiveRecord::Migration
  def self.up
    change_table :girls do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :girls, :image
  end
end
