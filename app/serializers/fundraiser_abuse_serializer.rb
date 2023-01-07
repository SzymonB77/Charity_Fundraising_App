# == Schema Information
#
# Table name: fundraiser_abuses
#
#  id            :bigint           not null, primary key
#  note          :text
#  phone_number  :bigint           not null
#  attachment    :binary
#  fundraiser_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class FundraiserAbuseSerializer < ActiveModel::Serializer
  attributes :id, :note, :phone_number, :attachment, :fundraiser_id
end
