# frozen_string_literal: true

# == Schema Information
#
# Table name: donations
#
#  id                :bigint           not null, primary key
#  amount            :decimal(, )      not null
#  note              :string
#  payment_successed :boolean          default(FALSE)
#  hidden_name       :boolean          default(FALSE)
#  hidden_amount     :boolean          default(FALSE)
#  fundraiser_id     :bigint           not null
#  user_id           :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  money_box_id      :bigint
#
class Donation < ApplicationRecord
  # validations
  validates :amount, presence: true
  validates :fundraiser_id, presence: true
  validates :user_id, presence: true

  validate :fundraiser_and_money_box_match

  def fundraiser_and_money_box_match
    if money_box.present? && fundraiser_id != money_box.fundraiser_id
      errors.add(:money_box, 'Must be associated with the same fundraiser as the moneybox')
    end
  end
  # associations
  belongs_to :user
  belongs_to :fundraiser
  belongs_to :money_box, optional: true
end
