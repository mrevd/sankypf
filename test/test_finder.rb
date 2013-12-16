require 'test/unit'
require 'shoulda'
require_relative '../lib/sanky/pathfinder/finder'

class TestFinder < Test::Unit::TestCase

  context "finder" do
    setup do
      @args = [
        '/test/doc1.txt', 'test/doc2.txt', 'volumes/doc3.txt', '/Volumes/doc4.txt',
        "L:\\CCBQ\\0-HTML-CCBQ\\Email\\2013\\2013-12-11_CCBQ_Holiday_Appeal-2"
      ]
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
          '/Volumes/doc4.txt',
          '/Volumes/SankyNet Drive/CCBQ/0-HTML-CCBQ/Email/2013/2013-12-11_CCBQ_Holiday_Appeal-2'
        ]

        assert_equal expected_results, @finder.convert.to_s
      end
    end
  end

end
