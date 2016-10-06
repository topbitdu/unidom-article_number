module Unidom::ArticleNumber::Concerns::AsBarcode

  extend ActiveSupport::Concern

  included do |includer|

    has_many :markings,        class_name: 'Unidom::ArticleNumber::Marking', as:     :barcode
    has_many :marked_products, through:    :markings,                        source: :marked, source_type: 'Unidom::Product::Product'

    def mark!(marked, by: nil, at: Time.now)
      raise ArgumentError.new('The marked argument is required.') if marked.blank?
      raise ArgumentError.new('The by argument is required.'    ) if by.blank?
      raise ArgumentError.new('The at argument is required.'    ) if at.blank?
      markings.create! marked: marked, marker: by, opened_at: at
    end

    def mark?(marked, at: Time.now)
      raise ArgumentError.new('The marked argument is required.') if marked.blank?
      raise ArgumentError.new('The at argument is required.'    ) if at.blank?
      markings.marked_is(marked).valid_at(now: at).alive.exists?
    end

  end

  module ClassMethods
  end

end
