module Cavendish
  class Config
    attr_reader :project_name
    attr_writer :testing_library

    def project_name=(value)
      @project_name = value.to_s.underscore.dasherize
    end

    def use_enzyme?
      @testing_library === 'Enzyme'
    end

    def human_project_name
      project_name.humanize
    end
  end
end
