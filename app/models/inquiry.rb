class Inquiry < ActiveRecord::Base

  belongs_to :item

  attr_accessible :first_name, :last_name, :email, :phone_number, :note, :item_id
  validates_presence_of :first_name, :note, :email
end
