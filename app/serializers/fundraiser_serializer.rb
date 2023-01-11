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
class FundraiserSerializer < ActiveModel::Serializer
  attributes :id, :title, :name, :surname, :reason, :city, :region,
             :end_date, :discription, :total_amount, :number_of_views, :donations, :fundraiser_photos,
             :fundraiser_updates

  attribute :creator_of_the_fundraiser do
    ProfileNameSerializer.new(object.user).attributes
  end

  def fundraiser_updates
    object.fundraiser_updates.order(:created_at).map do |update|
      FundraiserUpdateSerializer.new(update).attributes
    end
  end

  def fundraiser_photos
    object.photos.map do |photo|
      PhotoSerializer.new(photo).attributes
    end
  end

  def donations
    object.donations.where(payment_successed: true).map do |donation|
      DonationSerializer.new(donation).attributes
    end
  end

  def total_amount
    object.sum_donation
  end

  has_many :money_boxes, serializer: SimpleMoneyBoxSerializer
end
