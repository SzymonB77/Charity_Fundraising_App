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

  # associations
  belongs_to :user
  belongs_to :fundraiser
  belongs_to :money_box
end
