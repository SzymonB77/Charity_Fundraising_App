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
require 'rails_helper'

RSpec.describe ObservedFundraiser, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:fundraiser) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    describe 'user_id' do
      it { is_expected.to validate_presence_of(:user_id) }
    end

    describe 'fundraiser_id' do
      it { is_expected.to validate_presence_of(:fundraiser_id) }
    end

    describe 'uniqueness undraiser_id and user_id' do
      it { is_expected.to validate_uniqueness_of(:fundraiser_id).scoped_to(:user_id) }
    end
  end
end
