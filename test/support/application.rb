module Sample
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
  end
end
