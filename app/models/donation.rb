# == Schema Information
#
# Table name: donations
#
#  id               :bigint           not null, primary key
#  amount           :decimal(, )      not null
#  note             :string
#  payment_successed :boolean          default(FALSE)
#  hiden_name       :boolean          default(FALSE)
#  hidden_amount    :boolean          default(FALSE)
#  fundraiser_id    :bigint           not null
#  user_id          :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Donation < ApplicationRecord
  # validations
  validates :amount, presence: true

  # associations
  belongs_to :user
  belongs_to :fundraiser
end
