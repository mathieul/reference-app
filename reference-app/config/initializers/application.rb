{application: :APP_CONFIG}.each do |name, variable|
  config = YAML.load(File.read(Rails.root + "config/#{name}.yml"))
  values = config.has_key?(Rails.env) ? config[Rails.env] : config
  Object.const_set(variable, values.symbolize_keys)
end
