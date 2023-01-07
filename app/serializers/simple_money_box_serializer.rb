# frozen_string_literal: true

class SimpleMoneyBoxSerializer < ActiveModel::Serializer
  attributes :id, :title, :sum_of_money_box_donations, :total_unique_donators

  belongs_to :user, serializer: ProfileNameSerializer

  def sum_of_money_box_donations
    object.sum_donations
  end

  def total_unique_donators
    object.count_donators
  end
end
