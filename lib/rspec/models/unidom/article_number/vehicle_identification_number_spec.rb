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

    it_behaves_like 'validates', model_attributes, :code,
      {             } => 0,
      { code: nil   } => 2,
      { code: ''    } => 2,
      { code: '1'   } => 1,
      { code: 'A'   } => 1,
      { code: '11'  } => 1,
      { code: 'AA'  } => 1,
      { code: '111' } => 1,
      { code: 'AAA' } => 1,
      { code: 'LFVAA11A6X207535'   } => 1,
      { code: 'LFVAA11A6X2075354'  } => 1,
      { code: 'LFVAA11A6X2075355'  } => 0,
      { code: 'LFVAA11A6X2075356'  } => 1,
      { code: 'LFVAA11A6X20753559' } => 2

  end

end
