# frozen_string_literal: true

class SimpleFundraiserSerializer < ActiveModel::Serializer
  attributes :id, :title, :total_amount, :end_date, :count
end
