module LD4L
  module FoafRDF
    class Person < ActiveTriples::Resource

      class << self; attr_reader :localname_prefix end
      @localname_prefix="p"

      configure :type => RDF::Vocab::FOAF.Person, :base_uri => LD4L::FoafRDF.configuration.base_uri, :repository => :default
    end
  end
end
