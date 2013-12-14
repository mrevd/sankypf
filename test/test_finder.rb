require 'test/unit'
require 'shoulda'
require_relative '../lib/sanky/pathfinder/finder'

class TestFinder < Test::Unit::TestCase

  context "finder" do
    setup do
      @args = ['/test/doc1.txt', 'test/doc2.txt', 'volumes/doc3.txt', '/Volumes/doc4.txt']
      @finder = Sanky::PathFinder::Finder.new(@args)
    end

    context "initalization" do
      should "include arguements" do
        assert_equal @args, @finder.to_s
      end
    end

    context "conversion" do
      should "properly parse paths" do
        expected_results = [
          '/Volumes/test/doc1.txt',
          '/Volumes/test/doc2.txt',
          '/Volumes/volumes/doc3.txt',
          '/Volumes/doc4.txt'
        ]

        assert_equal expected_results, @finder.convert.to_s
      end
    end
  end

end
