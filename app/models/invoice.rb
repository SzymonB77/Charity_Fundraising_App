# == Schema Information
#
# Table name: invoices
#
#  id           :bigint           not null, primary key
#  title        :string
#  invoice_link :string           not null
#  user_id      :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Invoice < ApplicationRecord
  # validations
  validates :invoice_link, presence: true
  validates :user_id, presence: true
  # associations
  belongs_to :user
end
