require 'rdf'

module LD4L
  module FoafRDF
    class Person < ActiveTriples::Resource

      @local_name_prefix="p"

      configure :type => RDF::FOAF.Person, :base_uri => LD4L::FoafRDF.configuration.base_uri, :repository => :default
    end
  end
end
