# frozen_string_literal: true

module ::DiscourseMessageBusCorsModule
  class Engine < ::Rails::Engine
    engine_name PLUGIN_NAME
    isolate_namespace DiscourseMessageBusCorsModule
    config.autoload_paths << File.join(config.root, "lib")
  end
end
