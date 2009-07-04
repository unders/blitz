class FeatureGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.directory 'features'

      path = File.join('features', "#{file_name.pluralize}.feature")
      m.template 'feature.feature', path
    end
  end
end

