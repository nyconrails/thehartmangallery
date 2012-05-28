class Order < ActiveRecord::Base
  attr_accessor :credit_card_number, :card_type, :expiration_month, :expiration_year
end
