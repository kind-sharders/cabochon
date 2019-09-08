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
    pad(test_string, 8, "-=").should eq("-=test-=")
    pad(test_string, 11, "-=").should eq("-=-=test-=-")
  end

  it "digit? with empty string returns false" do
    digit?("").should eq(false)
  end

  it "digit? with string without numbers returns false" do
    digit?("test string").should eq(false)
  end

  it "digit? with numbers only return true" do
    digit?("123456").should eq(true)
  end

  it "digit? with number and any characters returns false" do
    digit?("123abc").should eq(false)
    digit?("").should eq(false)
    digit?("12.34").should eq(false)
    digit?("1.5e5").should eq(false)
    digit?("-123").should eq(false)
  end

  it "capitalize? returns false if string is not capitalized" do
    capitalize?("").should eq(false)
    capitalize?("abc").should eq(false)
    capitalize?("ABC").should eq(false)
    capitalize?("Abc Abc").should eq(false)
    capitalize?("Abc ABC").should eq(false)
  end

  it "capitalize? returns true if string is capitalized" do
    capitalize?("Abc").should eq(true) 
    capitalize?("Abc abc").should eq(true)
    capitalize?("A").should eq(true)
  end

  it "downcase? return false if not all cased characters in the string are lowercase" do
    downcase?("").should eq(false)
    downcase?("Abc").should eq(false)
    downcase?("abC").should eq(false)
    downcase?("ABC").should eq(false)
  end

  it "downcase? return true if all cased characters in the string are lowercase" do
    downcase?("abc").should eq(true)
    downcase?("abc 123").should eq(true)
    downcase?("    ").should eq(true)
    downcase?("a").should eq(true)
  end

end
