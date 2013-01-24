class Girl < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  scope :published, where(:published => true)
  scope :not_published, where(:published => false)
  attr_accessible :title, :description, :image, :published
  acts_as_commentable
  has_many :comments
  has_attached_file :image, :styles => { :preview => "800x600>", :medium => "200x300>", :thumb => "100x100>" }
  validates_attachment :image, :presence => true,
    :content_type => { :content_type => ['image/jpeg', 'image/jpg', 'image/png'] },
    :size => { :in => 0..1000.kilobytes }
end
