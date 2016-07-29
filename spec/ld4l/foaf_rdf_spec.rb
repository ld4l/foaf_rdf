require "spec_helper"

describe "LD4L::FoafRDF" do
  describe "#configure" do

    before do
      LD4L::FoafRDF.configure do |config|
        config.base_uri = "http://localhost/test/"
        config.localname_minter = lambda { |prefix=""| prefix+'_configured_'+SecureRandom.uuid }
      end
      class DummyPerson < LD4L::FoafRDF::Person
        configure :type => RDF::Vocab::FOAF.Person, :base_uri => LD4L::FoafRDF.configuration.base_uri, :repository => :default
      end
    end
    after do
      LD4L::FoafRDF.reset
      Object.send(:remove_const, "DummyPerson") if Object
    end

    it "should return configured value" do
      config = LD4L::FoafRDF.configuration
      expect(config.base_uri).to eq "http://localhost/test/"
      expect(config.localname_minter).to be_kind_of Proc
    end

    it "should use configured value in Person sub-class" do
      p = DummyPerson.new('1')
      expect(p.rdf_subject.to_s).to eq "http://localhost/test/1"

      p = DummyPerson.new(ActiveTriples::LocalName::Minter.generate_local_name(
                                   LD4L::FoafRDF::Person, 10, 'foo',
                                   &LD4L::FoafRDF.configuration.localname_minter ))
      expect(p.rdf_subject.to_s.size).to eq 73
      expect(p.rdf_subject.to_s).to match /http:\/\/localhost\/test\/foo_configured_[a-zA-Z0-9]{8}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{12}/
    end
  end

  describe ".reset" do
    before :each do
      LD4L::FoafRDF.configure do |config|
        config.base_uri = "http://localhost/test/"
        config.localname_minter = lambda { |prefix=""| prefix+'_configured_'+SecureRandom.uuid }
      end
    end

    it "resets the configuration" do
      LD4L::FoafRDF.reset
      config = LD4L::FoafRDF.configuration
      expect(config.base_uri).to eq "http://localhost/"
      expect(config.localname_minter).to eq nil
    end
  end
end