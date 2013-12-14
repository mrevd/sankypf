require 'optparse'

module Sanky
  module PathFinder
    class Options
      attr_reader :arguments

      def initialize(argv)
        parse(argv)
        @arguments = argv
      end

    private

      def parse(argv)
        OptionParser.new do |opts|
          opts.banner = "Usage: sankypf file [ file ] ..."

          opts.on("-h", "--help", "Show this message") do
            puts opts
            exit
          end

          begin
            argv = ["-h"] if argv.empty?
            opts.parse!(argv)
          rescue OptionParser::ParseError => e
            STDERR.puts e.message, "\n", opts
            exit(1)
          end
        end
      end
    end
  end
end
