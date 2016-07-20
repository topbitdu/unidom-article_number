module Unidom::ArticleNumber::Concerns::AsMarked

  extend ActiveSupport::Concern

  self.included do |includer|

    has_many :markings, class_name: 'Unidom::ArticleNumber::Marking', as: :marked

  end

end
