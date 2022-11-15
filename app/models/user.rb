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
#  NIP                           :integer
#  authentication_method         :string
#  daily_donation_limit          :decimal(, )      default(50000.0)
#  receive_notifications         :boolean          default(TRUE)
#  SMS_notifications             :boolean          default(FALSE)
#  SMS_notifications_amount      :decimal(, )      default(100.0)
#  receive_invoices              :boolean          default(FALSE)
#  visible_address               :boolean          default(FALSE)
#  visible_email                 :boolean          default(FALSE)
#  visible_avatar                :boolean          default(TRUE)
#  visible_phone_number          :boolean          default(TRUE)
#  visible_registration_date     :boolean          default(TRUE)
#  visible_supported_fundraisers :boolean          default(TRUE)
#  visible_in_browser            :boolean          default(TRUE)
#  tokens                        :json
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
end
