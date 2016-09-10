module Unidom::ArticleNumber::Concerns::AsMarked

  extend ActiveSupport::Concern

  included do |includer|

    has_many :markings, class_name: 'Unidom::ArticleNumber::Marking', as: :marked

    def is_marked!(as: nil, by: nil, at: Time.now)
      raise ArgumentError.new('The as argument is required.') if as.blank?
      raise ArgumentError.new('The by argument is required.') if by.blank?
      raise ArgumentError.new('The at argument is required.') if at.blank?
      markings.create! barcode: as, marker: by, opened_at: at
    end

    def is_marked?(as: nil, at: Time.now)
      raise ArgumentError.new('The as argument is required.') if as.blank?
      raise ArgumentError.new('The at argument is required.') if at.blank?
      markings.barcode_is(as).valid_at(now: at).alive.exists?
    end

  end

end
