class Order < ActiveRecord::Base

  belongs_to :item

  attr_accessor :credit_card_number, :card_type, :expiration_month, :expiration_year, :cvv
  attr_accessible :first_name, :last_name, :address, :city, :state, :postal_code, :cvv, :item_id, :phone_number, :email, :credit_card_number, :card_type, :expiration_month, :expiration_year

  before_create :process_credit_card

  validates_presence_of :first_name, :last_name, :address, :city, :state, :postal_code, :phone_number, :email, :credit_card_number, :card_type, :expiration_month, :expiration_year, :cvv

  def process_credit_card
    api_login_id = '9tMj92Xp' # INVALID, REPLACE WITH NEW
    api_transaction_key = '9z397P5K2Jyw9ZpF' # INVALID, REPLACE WITH NEW

    # ActiveMerchant::Billing::Base.mode = :test

    gateway = ActiveMerchant::Billing::AuthorizeNetGateway.new(
      :login  => api_login_id,
      :password => api_transaction_key
    )

    credit_card = ActiveMerchant::Billing::CreditCard.new(
      :number => self.credit_card_number,
      :month => self.expiration_month,
      :year => self.expiration_year,
      :verification_value => self.cvv,
      :first_name => self.first_name,
      :last_name => self.last_name,
      :type => self.card_type
    )

    if credit_card.valid?

      charge_amount = Item.find_by_id(self.item_id).price

      billing_address = { :name => "#{self.first_name} #{self.last_name}", :address1 => self.address,
      :city => self.city, :state => self.state,
      :country => 'US', :zip => self.postal_code, :phone => self.phone_number }

      options = {:address => {}, :billing_address => billing_address}

      response = gateway.purchase(charge_amount, credit_card, options)

      if response.success?
        self.paid = true
      else
        errors.add(:error, "We couldn't process your credit card")
        return false
      end

    else
      errors.add(:error, "Your credit card seems to be invalid")
      return false
    end
  end

end
