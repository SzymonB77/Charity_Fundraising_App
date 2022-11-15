# frozen_string_literal: true

class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :website
  attribute :full_name, unless: :company?
  attribute :image, if: :visible_avatar?
  attribute :company_name, if: :company?
  attribute :NIP, if: :company?
  attribute :adress_details, if: :visible_address?
  attribute :email, if: :visible_email?
  attribute :phone_number, if: :visible_phone_number?
  attribute :created_at, if: :visible_registration_date?

  def full_name
    "#{object.name} #{object.surname}"
  end

  def adress_details
    "#{object.city} #{object.zipcode} #{object.street} #{object.location_number}"
  end

  def company?
    object.company
  end

  def visible_address?
    object.visible_address
  end

  def visible_email?
    object.visible_email
  end

  def visible_phone_number?
    object.visible_phone_number
  end

  def visible_registration_date?
    object.visible_registration_date
  end

  def visible_avatar?
    object.visible_avatar
  end
end
