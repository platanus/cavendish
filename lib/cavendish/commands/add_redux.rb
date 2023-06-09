module Cavendish
  module Commands
    class AddRedux < Cavendish::Commands::Base
      def perform
        install_dependencies
      end

      private

      def install_dependencies
        run_in_project("yarn add #{redux_dependencies.join(' ')}")
      end

      def redux_dependencies
        %w[
          @reduxjs/toolkit
          react-redux
          redux-thunk
        ]
      end
    end
  end
end
