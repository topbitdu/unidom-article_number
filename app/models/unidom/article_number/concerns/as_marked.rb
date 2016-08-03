module Unidom::ArticleNumber::Concerns::AsMarked

  extend ActiveSupport::Concern

  self.included do |includer|

    has_many :markings, class_name: 'Unidom::ArticleNumber::Marking', as: :marked

    def is_marked!(as: nil, by: nil, at: Time.now)
      raise ArgumentError.new('The as argument is required.') if as.blank?
      raise ArgumentError.new('The by argument is required.') if by.blank?
      raise ArgumentError.new('The at argument is required.') if at.blank?
      markings.create! barcode: as, marker: by, opened_at: at
    end

  end

end
