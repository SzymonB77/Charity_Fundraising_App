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
class FundraiserUpdate < ApplicationRecord
  # validations
  validates :note, presence: true
  validates :fundraiser_id, presence: true

  # associations
  belongs_to :fundraiser
end
