module Unidom
  module ArticleNumber

    class Engine < ::Rails::Engine

      include Unidom::Common::EngineExtension

      isolate_namespace ::Unidom::ArticleNumber

      enable_initializer enum_enabled: false, migration_enabled: true

    end

  end
end
