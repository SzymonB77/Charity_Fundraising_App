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
class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :title, :invoice_link, :user_id
end
