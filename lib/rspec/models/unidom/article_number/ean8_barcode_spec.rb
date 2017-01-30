describe Unidom::ArticleNumber::Ean8Barcode, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      code: '12345678'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
