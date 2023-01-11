# frozen_string_literal: true

# == Schema Information
#
# Table name: observed_fundraisers
#
#  id            :bigint           not null, primary key
#  fundraiser_id :bigint           not null
#  user_id       :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class ObservedFundraiserSerializer < ActiveModel::Serializer
  attributes :id, :fundraiser_title

  def fundraiser_title
    fundraiser = Fundraiser.find(object.fundraiser_id)
    fundraiser.title
  end
end
