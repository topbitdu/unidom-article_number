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

    it_behaves_like 'scope', :barcode_is, [
      { attributes_collection: [ model_attributes                                                                           ], count_diff: 0, args: [ Unidom::ArticleNumber::Ean13Barcode.new(               id: model_attributes[:barcode_id]) ] },
      { attributes_collection: [ model_attributes                                                                           ], count_diff: 0, args: [ Unidom::ArticleNumber::Ean8Barcode.new(                id: model_attributes[:barcode_id]) ] },
      { attributes_collection: [ model_attributes                                                                           ], count_diff: 0, args: [ Unidom::ArticleNumber::VehicleIdentificationNumber.new(id: model_attributes[:barcode_id]) ] },
      { attributes_collection: [ model_attributes.merge(barcode_type: 'Unidom::ArticleNumber::Ean13Barcode'               ) ], count_diff: 1, args: [ Unidom::ArticleNumber::Ean13Barcode.new(               id: model_attributes[:barcode_id]) ] },
      { attributes_collection: [ model_attributes.merge(barcode_type: 'Unidom::ArticleNumber::Ean13Barcode'               ) ], count_diff: 0, args: [ Unidom::ArticleNumber::Ean8Barcode.new(                id: model_attributes[:barcode_id]) ] },
      { attributes_collection: [ model_attributes.merge(barcode_type: 'Unidom::ArticleNumber::Ean13Barcode'               ) ], count_diff: 0, args: [ Unidom::ArticleNumber::VehicleIdentificationNumber.new(id: model_attributes[:barcode_id]) ] },
      { attributes_collection: [ model_attributes.merge(barcode_type: 'Unidom::ArticleNumber::Ean8Barcode'                ) ], count_diff: 0, args: [ Unidom::ArticleNumber::Ean13Barcode.new(               id: model_attributes[:barcode_id]) ] },
      { attributes_collection: [ model_attributes.merge(barcode_type: 'Unidom::ArticleNumber::Ean8Barcode'                ) ], count_diff: 1, args: [ Unidom::ArticleNumber::Ean8Barcode.new(                id: model_attributes[:barcode_id]) ] },
      { attributes_collection: [ model_attributes.merge(barcode_type: 'Unidom::ArticleNumber::Ean8Barcode'                ) ], count_diff: 0, args: [ Unidom::ArticleNumber::VehicleIdentificationNumber.new(id: model_attributes[:barcode_id]) ] },
      { attributes_collection: [ model_attributes.merge(barcode_type: 'Unidom::ArticleNumber::VehicleIdentificationNumber') ], count_diff: 0, args: [ Unidom::ArticleNumber::Ean13Barcode.new(               id: model_attributes[:barcode_id]) ] },
      { attributes_collection: [ model_attributes.merge(barcode_type: 'Unidom::ArticleNumber::VehicleIdentificationNumber') ], count_diff: 0, args: [ Unidom::ArticleNumber::Ean8Barcode.new(                id: model_attributes[:barcode_id]) ] },
      { attributes_collection: [ model_attributes.merge(barcode_type: 'Unidom::ArticleNumber::VehicleIdentificationNumber') ], count_diff: 1, args: [ Unidom::ArticleNumber::VehicleIdentificationNumber.new(id: model_attributes[:barcode_id]) ] }
    ]

  end

end
