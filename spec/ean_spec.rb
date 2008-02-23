require File.dirname(__FILE__) + '/spec_helper.rb'

describe "EAN::Ean" do
  include EAN::SpecHelpers
  
  before(:each) do
  end
  
  after(:each) do
  end

  it "should generate for all zeros" do
    '0-00000-00000'.generate_check_digit.should == '0'
  end

  it "should generate for single 1s" do
    '1-00000-00000'.generate_check_digit.should == '7'
    '0-10000-00000'.generate_check_digit.should == '9'
    '0-01000-00000'.generate_check_digit.should == '7'
    '0-00100-00000'.generate_check_digit.should == '9'
    '0-00010-00000'.generate_check_digit.should == '7'
    '0-00001-00000'.generate_check_digit.should == '9'
    '0-00000-10000'.generate_check_digit.should == '7'
    '0-00000-01000'.generate_check_digit.should == '9'
    '0-00000-00100'.generate_check_digit.should == '7'
    '0-00000-00010'.generate_check_digit.should == '9'
    '0-00000-00001'.generate_check_digit.should == '7'
  end

  it "should generate for real numbers" do
    samples_values.each do |value|
      (value.chop+value.chop.generate_check_digit).should == value
    end
  end

  it "should validate for GTIN-8" do
    "1234555".generate_check_digit.should == "7"
  end

  it "should generate for GTIN-13" do
    "123456789012".generate_check_digit.should == "8"
  end

  it "should generate for GTIN-14" do
    "1234567890123".generate_check_digit.should == "1"
  end

  it "should ignore non numbers" do
    "7sdasdasda8sdsa47asdsa9asda4as0adsa0asda1adsa60asdasdas!${%^&*}2".upc?.should == true
  end

  it "should validate for all zeros" do
    '0-00000-00000-0'.generate_check_digit.should == '0'
  end

  it "should validate for single 1s" do
    '1-00000-00000-7'.upc?.should == true
    '0-10000-00000-9'.upc?.should == true
    '0-01000-00000-7'.upc?.should == true
    '0-00100-00000-9'.upc?.should == true
    '0-00010-00000-7'.upc?.should == true
    '0-00001-00000-9'.upc?.should == true
    '0-00000-10000-7'.upc?.should == true
    '0-00000-01000-9'.upc?.should == true
    '0-00000-00100-7'.upc?.should == true
    '0-00000-00010-9'.upc?.should == true
    '0-00000-00001-7'.upc?.should == true
  end

  it "should validate for real numbers" do
    samples_values.each do |value|
      value.upc?.should == true
    end
  end
  
  it "should validate for GTIN-8" do
    "12345557".upc?.should == true
  end

  it "should validate for GTIN-13" do
    "1234567890128".upc?.should == true
  end

  it "should validate for GTIN-14" do
    "12345678901231".upc?.should == true
  end

  it "should convert all 4 cases to gtin" do
    "12345557".to_gtin.should == "00000012345557"
    "784794001602".to_gtin.should == "00784794001602"
    "1234567890128".to_gtin.should == "01234567890128"
    "12345678901231".to_gtin.should == "12345678901231"
  end

  it "should validate converted gtin-14" do
    "12345557".to_gtin.upc?.should == true
    "784794001602".to_gtin.upc?.should == true
    "1234567890128".to_gtin.upc?.should == true
    "12345678901231".to_gtin.upc?.should == true
  end
end
