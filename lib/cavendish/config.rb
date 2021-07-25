module Cavendish
  class Config
    attr_reader :project_name

    def project_name=(value)
      @project_name = value.to_s.underscore
    end

    def human_project_name
      project_name.humanize
    end
  end
end
