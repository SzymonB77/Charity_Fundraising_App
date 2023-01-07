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
FactoryBot.define do
  factory :debit_card do
    card_number { 1.5 }
    expiration_date { "2023-01-07" }
    cvv { 1 }
    user { nil }
  end
end
