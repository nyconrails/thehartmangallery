class Collection < ActiveRecord::Base
  
  scope :jewelry, :conditions => { :category => 'jewelry' }
  scope :antique, :conditions => { :category => 'antique' }
  
  attr_accessible :name, :category
  has_many :items
  
end
