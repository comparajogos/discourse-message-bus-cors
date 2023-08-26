# frozen_string_literal: true

# name: discourse-message-bus-cors
# about: TODO
# version: 0.0.1
# authors: Renato Atilio
# url: TODO
# required_version: 2.7.0

enabled_site_setting :discourse_message_bus_cors_enabled

module ::DiscourseMessageBusCorsModule
  PLUGIN_NAME = "discourse-message-bus-cors"
end

require_relative "lib/discourse_message_bus_cors/engine"

after_initialize do
  block = MessageBus.config[:extra_response_headers_lookup]

  MessageBus.extra_response_headers_lookup do |env|
    headers = block.call(env)

    headers.merge(
      {
        "Access-Control-Allow-Credentials" => "true",
        "Access-Control-Allow-Origin" => "http://localhost:3000",
      },
    )
  end
end
