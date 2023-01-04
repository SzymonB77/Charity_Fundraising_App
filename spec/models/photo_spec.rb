RSpec.describe Photo, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:fundraiser) }
  end

  describe 'validations' do
    describe 'photo' do
      it { is_expected.to validate_presence_of(:photo) }
    end

    describe 'fundraiser_id' do
      it { is_expected.to validate_presence_of(:fundraiser_id) }
    end
  end
end
