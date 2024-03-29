# frozen_string_literal: true

# == Schema Information
#
# Table name: fundraisers
#
#  id              :bigint           not null, primary key
#  title           :string           not null
#  date_of_birth   :date
#  name            :string
#  surname         :string
#  reason          :string
#  city            :string
#  region          :string
#  end_date        :date
#  discription     :jsonb
#  user_id         :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  number_of_views :integer          default(0)
#
class Fundraiser < ApplicationRecord
  # validations
  validates :title, presence: true
  validates :user_id, presence: true
  # associations
  has_many :donations, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :fundraiser_updates, dependent: :destroy
  has_many :money_boxes, dependent: :destroy
  has_many :observed_fundraisers, dependent: :destroy
  has_many :fundraiser_abuses
  belongs_to :user

  def increment(by = 1)
    self.number_of_views += by
    save
  end

  def sum_donation
    Donation.joins(:fundraiser).where(fundraiser: self, payment_successed: true).sum(:amount)
  end
end
