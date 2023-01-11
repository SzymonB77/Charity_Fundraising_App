# frozen_string_literal: true

# == Schema Information
#
# Table name: fundraiser_updates
#
#  id            :bigint           not null, primary key
#  note          :text             not null
#  fundraiser_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class FundraiserUpdateSerializer < ActiveModel::Serializer
  attributes :id, :note, :fundraiser_id, :update_from

  def update_from
    object.created_at.strftime('%Y-%m-%d %H:%M')
  end
end
