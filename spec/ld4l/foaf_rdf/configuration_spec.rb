require 'spec_helper'

describe 'LD4L::FoafRDF' do

  describe '#configuration' do
    describe "base_uri" do
      context "when base_uri is not configured" do
        before do
          class DummyPerson < LD4L::FoafRDF::Person
            configure :type => RDF::FOAF.Person, :base_uri => LD4L::FoafRDF.configuration.base_uri, :repository => :default
          end
        end
        after do
          Object.send(:remove_const, "DummyPerson") if Object
        end
        it "should generate a Person URI using the default base_uri" do
          expect(DummyPerson.new('1').rdf_subject.to_s).to eq "http://localhost:3000/s1"
        end
      end

      context "when uri ends with slash" do
        before do
          LD4L::FoafRDF.configure do |config|
            config.base_uri = "http://localhost:3000/test_slash/"
          end
          class DummyPerson < LD4L::FoafRDF::Person
            configure :type => RDF::FOAF.Person, :base_uri => LD4L::FoafRDF.configuration.base_uri, :repository => :default
          end
        end
        after do
          Object.send(:remove_const, "DummyPerson") if Object
          LD4L::FoafRDF.reset
        end

        it "should generate a Person URI using the base_uri" do
          expect(DummyPerson.new('1').rdf_subject.to_s).to eq "http://localhost:3000/test_slash/s1"
        end
      end

      context "when uri does not end with slash" do
        before do
          LD4L::FoafRDF.configure do |config|
            config.base_uri = "http://localhost:3000/test_no_slash"
          end
          class DummyPerson < LD4L::FoafRDF::Person
            configure :type => RDF::FOAF.Person, :base_uri => LD4L::FoafRDF.configuration.base_uri, :repository => :default
          end
        end
        after do
          Object.send(:remove_const, "DummyPerson") if Object
          LD4L::FoafRDF.reset
        end

        it "should generate a Person URI using the base_uri" do
          expect(DummyPerson.new('1').rdf_subject.to_s).to eq "http://localhost:3000/test_no_slash/s1"
        end
      end
    end
  end

  describe "LD4L::FoafRDF::Configuration" do
    describe "#base_uri" do
      it "should default to localhost" do
        expect(LD4L::FoafRDF::Configuration.new.base_uri).to eq "http://localhost:3000/"
      end

      it "should be settable" do
        config = LD4L::FoafRDF::Configuration.new
        config.base_uri = "http://localhost:3000/test"
        expect(config.base_uri).to eq "http://localhost:3000/test"
      end
    end
  end

end
