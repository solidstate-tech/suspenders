require_relative "base"

module Suspenders
  class StylelintGenerator < Generators::Base
    def create_stylelintrc
      copy_file "stylelintrc.json", ".stylelintrc.json"
    end

    def install_dependencies
      case self.behavior
      when :invoke
        run "bin/yarn add stylelint --dev"
        run "bin/yarn add @thoughtbot/stylelint-config --dev"
      when :revoke
        self.behavior = :invoke
        run "bin/yarn remove stylelint"
        run "bin/yarn remove @thoughtbot/stylelint-config"
        self.behavior = :revoke
      end
    end
  end
end
