require "spec_helper"

describe "LD4L::FoafRDF" do
  describe "#configure" do

    before do
      LD4L::FoafRDF.configure do |config|
        config.base_uri = "http://localhost/test/"
      end
      class DummyPerson < LD4L::FoafRDF::Person
        configure :type => RDF::FOAF.Person, :base_uri => LD4L::FoafRDF.configuration.base_uri, :repository => :default
      end
    end
    after do
      LD4L::FoafRDF.reset
      Object.send(:remove_const, "DummyPerson") if Object
    end

    it "should return configured value" do
      config = LD4L::FoafRDF.configuration
      expect(config.base_uri).to eq "http://localhost/test/"
    end

    it "should use configured value in Person sub-class" do
      p = DummyPerson.new('1')
      expect(p.rdf_subject.to_s).to eq "http://localhost/test/1"
    end
  end

  describe ".reset" do
    before :each do
      LD4L::FoafRDF.configure do |config|
        config.base_uri = "http://localhost/test/"
      end
    end

    it "resets the configuration" do
      LD4L::FoafRDF.reset
      config = LD4L::FoafRDF.configuration
      expect(config.base_uri).to eq "http://localhost/"
    end
  end
end