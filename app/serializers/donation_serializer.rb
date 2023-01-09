# frozen_string_literal: true

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
  attributes :id, :amount, :note, :username, :sent

  def amount
    object.hidden_amount ? 'unknown' : object.amount
  end

  def username
    object.hidden_name ? 'anonymous' : username1
  end

  def username1
    ProfileNameSerializer.new(object.user).attributes
  end

  def sent
    object.created_at.strftime('%Y-%m-%d %H:%M')
  end
end
