#LD4L::FoafRDF

LD4L FOAF RDF provides tools for modeling person triples based on the FOAF ontology and persisting to a triplestore.

## Installation

Add this line to your application's Gemfile:

    gem 'ld4l-foaf_rdf'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ld4l-foaf_rdf

## Usage

**Caveat:** This gem is part of the LD4L Project and is being used in that context.  There is no guarantee that the 
code will work in a usable way outside of its use in LD4L Use Cases.

### Models

The LD4L::FoafRDF gem provides model definitions using the 
[ActiveTriples](https://github.com/no-reply/ActiveTriples) framework extension of 
[ruby-rdf/rdf](https://github.com/ruby-rdf/rdf).  The following models are provided:

1. LD4L::FoafRDF::Person - Implements the Person class in the FOAF ontology.

### Ontologies

The listed ontologies are used to represent the primary metadata about the person.
Other ontologies may also be used that aren't listed.
 
* [FOAF](http://xmlns.com/foaf/spec/)
* [RDF](http://www.w3.org/TR/rdf-syntax-grammar/)



## Contributing

1. Fork it ( https://github.com/[my-github-username]/ld4l-foaf_rdf/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
