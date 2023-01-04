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
require 'rails_helper'

RSpec.describe FundraiserUpdate, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:fundraiser) }
  end

  describe 'validations' do
    describe 'note' do
      it { is_expected.to validate_presence_of(:note) }
    end

    describe 'fundraiser_id' do
      it { is_expected.to validate_presence_of(:fundraiser_id) }
    end
  end
end
