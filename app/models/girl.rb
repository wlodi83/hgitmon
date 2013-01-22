class Girl < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  attr_accessible :title, :description, :image
  has_attached_file :image, :styles => { :preview => "800x600>", :medium => "200x300>", :thumb => "100x100>" }
end
