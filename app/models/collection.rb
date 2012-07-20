class Collection < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged

  scope :jewelry, :conditions => { :category => 'jewelry' }
  scope :antique, :conditions => { :category => 'antique' }

  attr_accessible :name, :category
  has_many :items

end
