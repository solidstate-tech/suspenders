require_relative "../base"

module Suspenders
  module Production
    class CompressionGenerator < Generators::Base
      def add_rack_deflater
        inject_into_file(
          "config/environments/production.rb",
          %{\n  config.middleware.use Rack::Deflater},
          before: "\nend",
        )
      end
    end
  end
end
