class Product < ActiveRecord::Base
  belongs_to :user
  has_many :buyers
  has_many :purchasers, through: :buyers, source: :user, foreign_key: "user_id"

  validates_presence_of :name, :amount
  validates_numericality_of :amount, greater_than: (0)
  after_initialize :init

  def init
    self.purchased = false if self.purchased.nil?
  end

end
