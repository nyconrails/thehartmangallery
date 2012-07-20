class Item < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged

  attr_accessible :name, :description, :dimensions, :dating, :provenance, :signed, :price

  has_many :images
  belongs_to :collection




end
