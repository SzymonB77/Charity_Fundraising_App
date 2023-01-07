# == Schema Information
#
# Table name: debit_cards
#
#  id              :bigint           not null, primary key
#  card_number     :float            not null
#  expiration_date :date             not null
#  cvv             :integer          not null
#  user_id         :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class DebitCardSerializer < ActiveModel::Serializer
  attributes :id, :card_name, :my_card_number, :expiration_date, :cvv
  def card_name
    object.name + ' ' + object.surname
  end

  def my_card_number
    object.card_number.to_s.gsub(/(\d{4})/, '\1 ').strip
  end
end
