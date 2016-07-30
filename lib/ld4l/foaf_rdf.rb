require 'rdf'
require 'active_triples'
require 'active_triples/local_name'
require	'linkeddata'
require 'ld4l/foaf_rdf/version'


module LD4L
  module FoafRDF

    # Methods for configuring the GEM
    class << self
      attr_accessor :configuration
    end

    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.reset
      @configuration = Configuration.new
    end

    def self.configure
      yield(configuration)
    end


    # RDF vocabularies
    #    none - uses RDF::Vocab::FOAF vocabulary

    # autoload classes
    autoload :Configuration,         'ld4l/foaf_rdf/configuration'
    autoload :Person,                'ld4l/foaf_rdf/person'
    autoload :Agent,                 'ld4l/foaf_rdf/agent'
  end
end

