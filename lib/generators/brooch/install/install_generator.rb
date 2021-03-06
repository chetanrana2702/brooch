# frozen_string_literal: true
require 'rails/generators/base' 
module Brooch
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../../templates/controllers', __FILE__)

      def add_javascripts
        append_file('app/assets/javascripts/application.js', "//= require brooch \n")
      end

      def add_stylesheets
        inject_into_file('app/assets/stylesheets/application.scss', "*= require brooch\n", before: /\*\//, verbose: true)
      end

      def setup_routes
        route('resources :inline_validations, only: [:create]')
      end

      def create_controllers
        template('inline_validations_controller.rb', 'app/controllers/inline_validations_controller.rb')
      end
    end
  end
end
