# frozen_string_literal: true

# == Schema Information
#
# Table name: fundraisers
#
#  id            :bigint           not null, primary key
#  title         :string           not null
#  date_of_birth :date
#  name          :string
#  surname       :string
#  reason        :string
#  city          :string
#  region        :string
#  end_date      :date
#  discription   :jsonb
#  total_amount  :decimal(, )
#  user_id       :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  count         :integer          default(0)
#
class Fundraiser < ApplicationRecord
  # validations
  validates :title, presence: true
  # associations
  has_many :donations, dependent: :destroy
  belongs_to :user

  def increment(by = 1)
    self.count += by
    save
  end

  def sum_donation
    donations.where(payment_successed: true).sum(:amount)
  end
end
