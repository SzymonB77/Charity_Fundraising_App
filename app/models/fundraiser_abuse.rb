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
class FundraiserAbuse < ApplicationRecord
  # validations
  validates :note, length: { maximum: 500, too_long: "The maximum length of the 'note' is 500 characters" }
  validates :phone_number, presence: true
  validates :fundraiser_id, presence: true
  # associations
  belongs_to :fundraiser
end
