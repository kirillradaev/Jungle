class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  # def total
  #   @total = ((line_items.inject(0) {|sum, li| sum + (li.quantity * li.total_price_cents) }) / 100).round(2)
  # end

  

end
