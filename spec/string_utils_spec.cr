require "./spec_helper"
include Cabochon

describe StringUtils do

  it "pad without args" do
    pad().should eq("")
  end

  it "pad with only string returns the same string" do
    pad("test string").should eq("test string")
  end

  it "pad with string and length but without chars returns the same string" do
    pad("test string", 5).should eq("test string")
  end

  it "pad with string and length < string.len returns the same string" do
    test_string = "test string"
    pad(test_string, 3).should eq(test_string)
    pad(test_string, 3, "--").should eq(test_string)
    pad(test_string, 0, "--").should eq(test_string)
    pad(test_string, -1, "--").should eq(test_string)
  end

  it "pad with length > string.len" do
    test_string = "test"
    pad(test_string, 5, "-").should eq("-test")
    pad(test_string, 6, "-").should eq("-test-")
    pad(test_string, 7, "-").should eq("--test-")
    pad(test_string, 6, "-=").should eq("-test-")
    pad(test_string, 7, "-=").should eq("-=test-")
    pad(test_string, 11, "-=").should eq("-=-=test-=-")
  end


end
