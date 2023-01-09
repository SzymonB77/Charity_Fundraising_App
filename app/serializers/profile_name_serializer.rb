# frozen_string_literal: true

# ProfileName
class ProfileNameSerializer < ActiveModel::Serializer
  attribute :full_name, unless: :company?
  attribute :company_name, if: :company?

  def company?
    object.company
  end

  def full_name
    "#{object.name} #{object.surname}"
  end
end
