# frozen_string_literal: true

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
class MoneyBoxSerializer < ActiveModel::Serializer
  attributes :id, :title, :notification, :qrcode, :fundraiser_id, :user_id, :sum_of_money_box_donations,
             :total_unique_donators, :sum_of_fundraiser_donations

  belongs_to :user, serializer: ProfileNameSerializer
  has_many :donations, serializer: DonationSerializer

  def sum_of_money_box_donations
    object.sum_donations
  end

  def total_unique_donators
    object.count_donators
  end

  def sum_of_fundraiser_donations
    object.fundraiser.sum_donation
  end
end
