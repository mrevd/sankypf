require 'colorize'

module Sanky
  module PathFinder
    class Finder
      def initialize(arguments)
        @arguments = arguments
      end

      def to_s
        @arguments
      end

      def convert
        @arguments.map! do |original|
          # subsitute windows backslashes for forwardslashes and strip whitespace
          original = original.strip.gsub(/\\/, "/")
          original.sub!(/L:/, "/Volumes/SankNet Drive")
          original.sub!(/Z:/, "/Volumes/Sanky Direct Drive/Sanky Shared")
          original.sub!(/Z:/, "/Volumes/Sanky Direct Drive/Sanky Shared")
          original.sub!(/smb:\/\/sankycomserver/, "/Volumes")
          # if no leading / add one
          original.sub!(/^(?!\/)/, "/")
          # if it doesn't start with /Volumes add it
          original.sub!(/^(?!\/Volumes)/, "/Volumes")
          # String.sub returns nil if no sub was performed, always return the og
          original
        end

        self
      end

      def open
        @arguments.each do |target|
          begin
            # pipe STDERR to dev null in favor of custom prompt
            `open -g '#{target}' > /dev/null 2>/dev/null`
          ensure
            if $? == 0
              puts "Opening the file in the background...".yellow
            else
              puts "Failed to find #{target.red}!"
            end
          end
        end
      end
    end
  end
end
