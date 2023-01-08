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
RSpec.describe Photo, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:fundraiser) }
  end

  describe 'validations' do
    describe 'photo' do
      it { is_expected.to validate_presence_of(:photo) }
    end

    describe 'fundraiser_id' do
      it { is_expected.to validate_presence_of(:fundraiser_id) }
    end
  end
end
