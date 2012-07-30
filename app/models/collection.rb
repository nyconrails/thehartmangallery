class Collection < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_attached_file :file, :styles => { :medium => "300x300>", :thumb => "150x150>" }

  scope :jewelry, :conditions => { :category => 'jewelry' }
  scope :antique, :conditions => { :category => 'antique' }

  attr_accessible :name, :category, :description, :file
  has_many :items

end
