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
  attributes :id, :title, :notification, :qrcode, :fundraiser_id, :user_id, :total_donations

  belongs_to :user, serializer: ProfileNameSerializer
  has_many :donations, serializer: DonationSerializer

  def total_donations
    object.sum_donations
  end
end
