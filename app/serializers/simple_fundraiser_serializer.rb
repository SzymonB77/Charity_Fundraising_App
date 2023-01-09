# frozen_string_literal: true

class SimpleFundraiserSerializer < ActiveModel::Serializer
  attributes :id, :title, :end_date, :count
end
