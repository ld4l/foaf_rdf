require "spec_helper"

describe "LD4L::FoafRDF" do
  describe "#configure" do

    before :each do
      LD4L::FoafRDF.configure do |config|
        config.base_uri = "http://localhost:3000/test/"
      end
    end

    it "should return configured value" do
      config = LD4L::FoafRDF.configuration
      expect(config.base_uri).to eq "http://localhost:3000/test/"
    end

    it "should use configured value in Person class" do
      # FIXME fails if run with all tests because LD4L::FoafRDF::Person is already loaded by other tests with a different base_uri
      p = LD4L::FoafRDF::Person.new('1')
      expect(p.rdf_subject.to_s).to eq "http://localhost:3000/test/p1"
    end

    after :each do
      LD4L::FoafRDF.reset
    end
  end

  describe ".reset" do
    before :each do
      LD4L::FoafRDF.configure do |config|
        config.base_uri = "http://localhost:3000/test/"
      end
    end

    it "resets the configuration" do
      LD4L::FoafRDF.reset

      config = LD4L::FoafRDF.configuration

      expect(config.base_uri).to eq "http://localhost:3000/"
    end
  end
end