class Item < ActiveRecord::Base
  attr_accessible :name, :description, :dimensions, :dating, :provenance, :signed, :price
  has_many :images
  belongs_to :collection
end
