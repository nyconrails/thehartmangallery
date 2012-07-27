class Item < ActiveRecord::Base

  has_many :orders

  extend FriendlyId
  friendly_id :name, use: :slugged

  attr_accessible :name, :description, :dimensions, :dating, :provenance, :signed, :price, :collection_id

  has_many :images
  belongs_to :collection




end
