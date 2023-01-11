# frozen_string_literal: true

# == Schema Information
#
# Table name: identity_cards
#
#  id                :bigint           not null, primary key
#  name              :string           not null
#  surname           :string           not null
#  citizenship       :string
#  country_of_birth  :string           not null
#  sex               :string           not null
#  pesel             :bigint
#  series_and_number :string           not null
#  expiration_date   :date             not null
#  street            :string           not null
#  house_number      :integer          not null
#  city              :string           not null
#  zipcode           :integer          not null
#  user_id           :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class IdentityCardSerializer < ActiveModel::Serializer
  attributes :id, :name, :surname, :citizenship, :country_of_birth, :sex, :pesel,
             :series_and_number, :expiration_date, :street, :house_number, :city, :zipcode
end
