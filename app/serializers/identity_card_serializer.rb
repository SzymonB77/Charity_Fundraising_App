# frozen_string_literal: true

class IdentityCardSerializer < ActiveModel::Serializer
  attributes :id, :name, :surname, :citizenship, :country_of_birth, :sex, :pesel,
             :series_and_number, :expiration_date, :street, :house_number, :city, :zipcode
end
