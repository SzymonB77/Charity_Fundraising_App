class DonationSerializer < ActiveModel::Serializer
  attributes :id, :myamount, :note, :myusername, :payment_successed

  def myamount
    object.hidden_amount ? 'unknown' : object.amount
  end

  def myusername
    object.hidden_name ? 'anonymous' : username
  end

  def username
    ProfileNameSerializer.new(object.user).attributes
  end
end
