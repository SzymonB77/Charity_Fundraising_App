# frozen_string_literal: true

# == Schema Information
#
# Table name: debit_cards
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  surname         :string           not null
#  card_number     :string           not null
#  expiration_date :string
#  cvv             :integer          not null
#  user_id         :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class DebitCard < ApplicationRecord
  # validations
  validates :name, presence: true
  validates :surname, presence: true
  validates :card_number, presence: true, uniqueness: true
  validates :card_number, format: { with: /\A[0-9]{16}\z/, message: 'must have 16 digits' }
  validates :expiration_date, presence: true
  validates :expiration_date, format: { with: %r{\A\d{2}/\d{4}\z}, message: 'should be in the format MM/YYYY' }
  validates :cvv, presence: true
  validates :cvv, format: { with: /\A[0-9]{3}\z/, message: 'must have 3 digits' }
  validates :user_id, presence: true
  # associations
  belongs_to :user
end
