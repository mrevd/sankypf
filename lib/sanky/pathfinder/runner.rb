require_relative 'options'
require_relative 'finder'

module Sanky
  module PathFinder
    class Runner
      def initialize(argv)
        @options = Options.new(argv)
      end

      def run
        Sanky::PathFinder::Finder.new(@options.arguments).convert.open
      end
    end
  end
end
