# frozen_string_literal: true

# == Schema Information
#
# Table name: fundraisers
#
#  id            :bigint           not null, primary key
#  title         :string           not null
#  date_of_birth :date
#  name          :string
#  surname       :string
#  reason        :string
#  city          :string
#  region        :string
#  end_date      :date
#  discription   :jsonb
#  total_amount  :decimal(, )
#  user_id       :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  count         :integer          default(0)
#
require 'rails_helper'

RSpec.describe Fundraiser, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
