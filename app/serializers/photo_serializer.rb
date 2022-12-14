# frozen_string_literal: true

# == Schema Information
#
# Table name: photos
#
#  id            :bigint           not null, primary key
#  photo         :string           not null
#  fundraiser_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :photo, :fundraiser_id, :created_at

  def created_at
    object.created_at.strftime('%Y-%m-%d %H:%M')
  end
end
