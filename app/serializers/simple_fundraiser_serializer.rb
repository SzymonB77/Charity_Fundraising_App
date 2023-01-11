# frozen_string_literal: true

class SimpleFundraiserSerializer < ActiveModel::Serializer
  attributes :id, :title, :days_left
  def days_left
    object.end_date ? (object.end_date.to_date - Date.current).to_i : ''
  end
end
