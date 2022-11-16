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
#
class FundraiserSerializer < ActiveModel::Serializer
  attributes :id, :id, :title, :date_of_birth, :name, :surname, :reason, :city, :region, :end_date, :discription,
             :total_amount
end
