# frozen_string_literal: true

# == Schema Information
#
# Table name: invoices
#
#  id           :bigint           not null, primary key
#  title        :string
#  invoice_link :string           not null
#  user_id      :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'invoice_link' do
    describe 'title' do
      it { is_expected.to validate_presence_of(:invoice_link) }
    end

    describe 'user_id' do
      it { is_expected.to validate_presence_of(:user_id) }
    end
  end
end
