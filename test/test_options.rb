require 'test/unit'
require 'shoulda'
require_relative '../lib/sanky/pathfinder/options'

class TestOptions < Test::Unit::TestCase

  context "specifying a file" do
    should "return it" do
      opts = Sanky::PathFinder::Options.new(["/Volumes/Test/document.txt"])
      assert_equal ["/Volumes/Test/document.txt"], opts.arguments
    end
  end

  context "specifying multiple files" do
    should "return them" do
      docs = ["/doc1.txt", "doc2.txt"]
      opts = Sanky::PathFinder::Options.new(docs)
      assert_equal docs, opts.arguments
    end
  end

end
