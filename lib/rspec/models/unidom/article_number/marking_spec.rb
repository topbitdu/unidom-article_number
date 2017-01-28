describe Unidom::ArticleNumber::Marking, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      barcode_id:   SecureRandom.uuid,
      barcode_type: 'Unidom::ArticleNumber::Barcode::Mock',
      marked_id:    SecureRandom.uuid,
      marked_type:  'Unidom::ArticleNumber::Marked::Mock',
      marker_id:    SecureRandom.uuid,
      marker_type:  'Unidom::ArticleNumber::Marker::Mock'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
