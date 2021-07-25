module Cavendish
  class Config
    attr_accessor :project_name

    def human_project_name
      project_name.humanize
    end
  end
end
