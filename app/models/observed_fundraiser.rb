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
class ObservedFundraiser < ApplicationRecord
  # validations
  validates :fundraiser_id, presence: true
  validates :user_id, presence: true
  validates :fundraiser_id, uniqueness: { scope: :user_id,
                                          message: 'Fundraiser has already been observed by this user' }
  # associations
  belongs_to :fundraiser
  belongs_to :user
end
