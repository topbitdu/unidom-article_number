describe Unidom::ArticleNumber::VehicleIdentificationNumber, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      code: 'LVHCU165XD5002138'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
