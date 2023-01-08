# frozen_string_literal: true

# == Schema Information
#
# Table name: donations
#
#  id                :bigint           not null, primary key
#  amount            :decimal(, )      not null
#  note              :string
#  payment_successed :boolean          default(FALSE)
#  hidden_name       :boolean          default(FALSE)
#  hidden_amount     :boolean          default(FALSE)
#  fundraiser_id     :bigint           not null
#  user_id           :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  money_box_id      :bigint
#
require 'rails_helper'

RSpec.describe Donation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:fundraiser) }
    it { is_expected.to belong_to(:money_box).optional }
  end

  describe 'validations' do
    describe 'amount' do
      it { is_expected.to validate_presence_of(:amount) }
    end

    describe 'fundraiser_id' do
      it { is_expected.to validate_presence_of(:fundraiser_id) }
    end

    describe 'user_id' do
      it { is_expected.to validate_presence_of(:user_id) }
    end
  end
end
