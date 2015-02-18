module LD4L
  module FoafRDF
    class Agent < ActiveTriples::Resource

      class << self; attr_reader :localname_prefix end
      @localname_prefix="a"

      configure :type => RDF::FOAF.Agent, :base_uri => LD4L::FoafRDF.configuration.base_uri, :repository => :default

      property :label,   :predicate => RDF::RDFS.label
    end
  end
end
