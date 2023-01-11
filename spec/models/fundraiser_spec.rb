# frozen_string_literal: true

# == Schema Information
#
# Table name: fundraisers
#
#  id              :bigint           not null, primary key
#  title           :string           not null
#  date_of_birth   :date
#  name            :string
#  surname         :string
#  reason          :string
#  city            :string
#  region          :string
#  end_date        :date
#  discription     :jsonb
#  user_id         :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  number_of_views :integer          default(0)
#
require 'rails_helper'

RSpec.describe Fundraiser, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:donations).dependent(:destroy) }
    it { is_expected.to have_many(:money_boxes).dependent(:destroy) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    describe 'title' do
      it { is_expected.to validate_presence_of(:title) }
    end

    describe 'user_id' do
      it { is_expected.to validate_presence_of(:user_id) }
    end
  end
end
