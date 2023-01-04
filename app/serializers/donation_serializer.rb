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
class DonationSerializer < ActiveModel::Serializer
  attributes :id, :myamount, :note, :myusername, :created_at_datetime, :payment_successed, :money_box_id

  def myamount
    object.hidden_amount ? 'unknown' : object.amount
  end

  def myusername
    object.hidden_name ? 'anonymous' : username
  end

  def username
    ProfileNameSerializer.new(object.user).attributes
  end

  def created_at_datetime
  object.created_at.strftime('%Y-%m-%d %H:%M')
  end
end
