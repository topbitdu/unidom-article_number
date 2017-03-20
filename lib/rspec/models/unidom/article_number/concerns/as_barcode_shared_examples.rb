shared_examples 'Unidom::ArticleNumber::Concerns::AsBarcode' do |model_attributes|

  marking_1_attribtues = {
      marked_id:   SecureRandom.uuid,
      marked_type: 'Unidom::ArticleNumber::Marked::Mock',
      marker_id:   SecureRandom.uuid,
      marker_type: 'Unidom::ArticleNumber::Marker::Mock'
    }

  marking_2_attribtues = {
      marked_id:   SecureRandom.uuid,
      marked_type: 'Unidom::ArticleNumber::Marked::Mock',
      marker_id:   SecureRandom.uuid,
      marker_type: 'Unidom::ArticleNumber::Marker::Mock'
    }

  it_behaves_like 'has_many', model_attributes, :markings, Unidom::ArticleNumber::Marking, [ marking_1_attribtues, marking_2_attribtues ]

end
