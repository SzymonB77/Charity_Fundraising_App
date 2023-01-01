# == Schema Information
#
# Table name: money_boxes
#
#  id            :bigint           not null, primary key
#  title         :string           not null
#  notification  :text
#  qrcode        :string
#  fundraiser_id :bigint           not null
#  user_id       :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class MoneyBox < ApplicationRecord
  # validations
  validates :title, presence: true
  validates :fundraiser_id, presence: true
  validates :user_id, presence: true

  # functions

  def sum_donations
    Donation.joins(:money_box).where(money_box: self, payment_successed: true).sum(:amount)
  end

  def count_donators
    Donation.joins(:money_box).where(money_box: self, payment_successed: true).distinct.count(:user_id)
  end
  # associations
  has_many :donations
  belongs_to :user
  belongs_to :fundraiser
end
