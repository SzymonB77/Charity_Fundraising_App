# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                            :bigint           not null, primary key
#  provider                      :string           default("email"), not null
#  uid                           :string           default(""), not null
#  encrypted_password            :string           default(""), not null
#  reset_password_token          :string
#  reset_password_sent_at        :datetime
#  allow_password_change         :boolean          default(FALSE)
#  remember_created_at           :datetime
#  confirmation_token            :string
#  confirmed_at                  :datetime
#  confirmation_sent_at          :datetime
#  unconfirmed_email             :string
#  email                         :string           not null
#  name                          :string
#  surname                       :string
#  image                         :string
#  about_me                      :text
#  website                       :string
#  city                          :string
#  zipcode                       :integer
#  street                        :string
#  location_number               :integer
#  phone_number                  :integer
#  company                       :boolean
#  company_name                  :string
#  nip                           :integer
#  verified_user                 :string
#  daily_donation_limit          :decimal(, )      default(50000.0)
#  receive_invoices              :boolean          default(FALSE)
#  visible_address               :boolean          default(FALSE)
#  visible_email                 :boolean          default(FALSE)
#  visible_avatar                :boolean          default(TRUE)
#  visible_phone_number          :boolean          default(TRUE)
#  visible_registration_date     :boolean          default(TRUE)
#  visible_supported_fundraisers :boolean          default(TRUE)
#  tokens                        :json
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :surname, :image, :about_me, :website, :city, :zipcode, :street,
             :location_number, :phone_number, :company, :company_name, :nip,
             :verified_user, :receive_invoices,
             :visible_address, :visible_email, :visible_avatar, :visible_phone_number,
             :visible_registration_date, :visible_supported_fundraisers,
             :my_observed_fundraiser, :my_invoices

  has_many :donations, serializer: DonationSerializer
  has_many :debit_cards, serializer: DebitCardSerializer
  has_one :identity_card, serializer: IdentityCardSerializer
  has_many :my_fundraisers, serializer: SimpleFundraiserSerializer
  has_many :supported_fundraisers, serializer: SimpleFundraiserSerializer

  def my_observed_fundraiser
    object.observed_fundraisers.map do |observe|
      ObservedFundraiserSerializer.new(observe).attributes
    end
  end

  def my_invoices
    object.invoices.map do |invoice|
      InvoiceSerializer.new(invoice).attributes
    end
  end
end
