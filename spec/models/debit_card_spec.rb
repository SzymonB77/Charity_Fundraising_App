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
require 'rails_helper'

RSpec.describe DebitCard, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
