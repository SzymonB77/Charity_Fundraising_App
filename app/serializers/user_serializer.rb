# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :surname, :image, :about_me, :website, :city, :zipcode, :street,
             :location_number, :phone_number, :company, :company_name, :NIP,
             :authentication_method, :daily_donation_limit, :receive_notifications,
             :SMS_notifications, :SMS_notifications_amount, :receive_invoices,
             :visible_address, :visible_email, :visible_avatar, :visible_phone_number,
             :visible_registration_date, :visible_supported_fundraisers,
             :visible_in_browser
end
