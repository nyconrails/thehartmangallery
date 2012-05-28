class Collection < ActiveRecord::Base
  
  scope :jewelry, :conditions => { :type => 'jewelry' }
  scope :antique, :conditions => { :type => 'antique' }
  
  attr_accessible :name, :category
  has_many :items
  
end
