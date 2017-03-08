describe Unidom::ArticleNumber::Ean8Barcode, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      code: '12345678'
    }

    code_max_length = described_class.columns_hash['code'].limit

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates', model_attributes, :code,
      {             } => 0,
      { code: nil   } => 3,
      { code: ''    } => 3,
      { code: '1'   } => 1,
      { code: 'A'   } => 2,
      { code: '11'  } => 1,
      { code: 'AA'  } => 2,
      { code: '111' } => 1,
      { code: 'AAA' } => 2,
      { code: '1'*(code_max_length-1) } => 1,
      { code: 'A'*(code_max_length-1) } => 2,
      { code: '1'*code_max_length     } => 0,
      { code: 'A'*code_max_length     } => 1,
      { code: '1'*(code_max_length+1) } => 1,
      { code: 'A'*(code_max_length+1) } => 2

  end

end
