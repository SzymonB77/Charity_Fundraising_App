# frozen_string_literal: true

# == Schema Information
#
# Table name: identity_cards
#
#  id                :bigint           not null, primary key
#  name              :string           not null
#  surname           :string           not null
#  citizenship       :string
#  country_of_birth  :string           not null
#  sex               :string           not null
#  pesel             :bigint
#  series_and_number :string           not null
#  expiration_date   :date             not null
#  street            :string           not null
#  house_number      :integer          not null
#  city              :string           not null
#  zipcode           :integer          not null
#  user_id           :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class IdentityCard < ApplicationRecord
  # validations
  validates :name, presence: true
  validates :surname, presence: true
  validates :citizenship, presence: true
  validates :country_of_birth, presence: true
  validates :sex, presence: true
  validates :sex, inclusion: { in: %w[male female], message: 'must be male or female' }
  validates :pesel, uniqueness: true
  validates :pesel, length: { is: 11, message: 'must be 11 digits' }
  validates :series_and_number, presence: true
  validates :expiration_date, presence: true
  validates :street, presence: true
  validates :house_number, presence: true
  validates :city, presence: true
  validates :zipcode, presence: true
  validates :user_id, presence: true
  # associations
  belongs_to :user
end
