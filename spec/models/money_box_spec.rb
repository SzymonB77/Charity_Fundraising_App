# == Schema Information
#
# Table name: money_boxes
#
#  id            :bigint           not null, primary key
#  title         :string           not null
#  notification  :text
#  qrcode        :string
#  fundraiser_id :bigint           not null
#  user_id       :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'rails_helper'

RSpec.describe MoneyBox, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:fundraiser) }
    it { is_expected.to have_many(:donations) }
  end

  describe 'validations' do
    describe 'title' do
      it { is_expected.to validate_presence_of(:title) }
    end

    describe 'fundraiser_id' do
      it { is_expected.to validate_presence_of(:fundraiser_id) }
    end

    describe 'user_id' do
      it { is_expected.to validate_presence_of(:user_id) }
    end
  end
end
