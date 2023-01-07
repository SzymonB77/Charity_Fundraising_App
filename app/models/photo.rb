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
class Photo < ApplicationRecord
  # validations
  validates :photo, presence: true
  validates :fundraiser_id, presence: true
  # associations
  belongs_to :fundraiser
end
