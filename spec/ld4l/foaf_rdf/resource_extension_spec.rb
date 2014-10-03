require 'spec_helper'

describe 'LD4L::FoafRDF::ResourceExtension' do

  describe 'id_persisted?' do
    before(:all) do
      p = LD4L::FoafRDF::Person.new('1')
      p.persist!
    end

    context "when id is a string" do
      it "should be false if id does not exist" do
        expect(LD4L::FoafRDF::Person.id_persisted?('2')).to be_falsey
      end

      it "should be true if id exists" do
        expect(LD4L::FoafRDF::Person.id_persisted?('1')).to be_truthy
      end
    end

    context "when id is numeric" do
      it "should be false if id does not exist" do
        expect(LD4L::FoafRDF::Person.id_persisted?(2)).to be_falsey
      end

      it "should be true if id exists" do
        expect(LD4L::FoafRDF::Person.id_persisted?(1)).to be_truthy
      end
    end
  end

  describe 'uri_persisted?' do
    before(:all) do
      p = LD4L::FoafRDF::Person.new('11')
      p.persist!
    end

    context "when URI is a http string" do
      it "should be false if URI does not exist" do
        p = LD4L::FoafRDF::Person.new
        test_uri = p.get_uri('22').to_s
        expect(LD4L::FoafRDF::Person.uri_persisted?(test_uri)).to be_falsey
      end

      it "should be true if URI does exist" do
        p = LD4L::FoafRDF::Person.new
        test_uri = p.get_uri('11').to_s
        expect(LD4L::FoafRDF::Person.uri_persisted?(test_uri)).to be_truthy
      end
    end

    context "when URI is a RDF::URI" do
      it "should be false if URI does not exist" do
        p = LD4L::FoafRDF::Person.new
        test_uri = p.get_uri('22')
        expect(LD4L::FoafRDF::Person.uri_persisted?(test_uri)).to be_falsey
      end

      it "should be true if URI does exist" do
        p = LD4L::FoafRDF::Person.new
        test_uri = p.get_uri('11')
        expect(LD4L::FoafRDF::Person.uri_persisted?(test_uri)).to be_truthy
      end
    end
  end
end
