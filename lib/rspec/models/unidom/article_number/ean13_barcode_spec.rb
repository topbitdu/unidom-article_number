describe Unidom::ArticleNumber::Ean13Barcode, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      code: '1234567890123'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
