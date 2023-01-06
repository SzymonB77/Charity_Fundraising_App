class ObservedFundraiserSerializer < ActiveModel::Serializer
  attributes :id, :fundraiser_title, :fundraiser_id, :user_id

  def fundraiser_title
    fundraiser = Fundraiser.find(object.fundraiser_id)
    fundraiser.title
  end
end
