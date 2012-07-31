class Item < ActiveRecord::Base

  has_many :orders
  has_many :inquiries

  extend FriendlyId
  friendly_id :name, use: :slugged

  attr_accessible :inventory, :inventoryid, :name, :description, :dimensions, :dating, :provenance, :signed, :price, :collection_id, :note

  scope :in_stock, where("inventory > 0")

  has_many :images
  belongs_to :collection




end
