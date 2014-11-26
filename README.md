#LD4L::FoafRDF

LD4L FOAF RDF provides tools for modeling person triples based on the FOAF ontology and persisting to a triplestore.


## Installation

Temporary get the gem from github until the gem is released publicly.

Add this line to your application's Gemfile:

<!--    gem 'ld4l-foaf_rdf' -->
    gem 'ld4l-foaf_rdf', '~> 0.0.3', :git => 'git@github.com:ld4l/foaf_rdf.git'
    

And then execute:

    $ bundle install

<!--
Or install it yourself as:

    $ gem install ld4l-foaf_rdf
-->


## Usage

**Caveat:** This gem is part of the LD4L Project and is being used in that context.  There is no guarantee that the 
code will work in a usable way outside of its use in LD4L Use Cases.

### Examples

Setup required for all examples.
```
require 'ld4l/foaf_rdf'

# create an in-memory repository
ActiveTriples::Repositories.add_repository :default, RDF::Repository.new
```

Example creating a person.
```
p = LD4L::FoafRDF::Person.new('p4')

puts p.dump :ttl
```

Example triples created for a person.
```
<http://localhost/p4> a <http://xmlns.com/foaf/0.1/Person> .
```


### Configurations

* base_uri - base URI used when new resources are created (default="http://localhost/")
* localname_minter - minter function to use for creating unique local names (default=nil which uses default minter in active_triples-local_name gem)

*Setup for all examples.*

* Restart your interactive session (e.g. irb, pry).
* Use the Setup for all examples in main Examples section above.

*Example usage using configured base_uri and default localname_minter.*
```
LD4L::FoafRDF.configure do |config|
  config.base_uri = "http://example.org/"
end

p = LD4L::FoafRDF::Person.new(ActiveTriples::LocalName::Minter.generate_local_name(
              LD4L::FoafRDF::Person, 10, {:prefix=>'p'} ))

puts p.dump :ttl
```
NOTE: If base_uri is not used, you need to restart your interactive environment (e.g. irb, pry).  Once the 
  Person class is instantiated the first time, the base_uri for the class is set.  If you ran
  through the main Examples, the base_uri was set to the default base_uri.


*Example triples created for a person with configured base_uri and default minter.*
```
<http://example.org/p45c9c85b-25af-4c52-96a4-cf0d8b70a768> a <http://xmlns.com/foaf/0.1/Person> .
```

*Example usage using configured base_uri and configured localname_minter.*
```
LD4L::FoafRDF.configure do |config|
  config.base_uri = "http://example.org/"
  config.localname_minter = lambda { |prefix=""| prefix+'_configured_'+SecureRandom.uuid }
end

p = LD4L::FoafRDF::Person.new(ActiveTriples::LocalName::Minter.generate_local_name(
              LD4L::FoafRDF::Person, 10, 'p',
              &LD4L::FoafRDF.configuration.localname_minter ))

puts p.dump :ttl
```
NOTE: If base_uri is not used, you need to restart your interactive environment (e.g. irb, pry).  Once the 
  Person class is instantiated the first time, the base_uri for the class is set.  If you ran
  through the main Examples, the base_uri was set to the default base_uri.


*Example triples created for a person with configured base_uri and configured minter.*
```
<http://example.org/p_configured_6498ba05-8b21-4e8c-b9d4-a6d5d2180966> a <http://xmlns.com/foaf/0.1/Person> .
```


### Models

The LD4L::FoafRDF gem provides model definitions using the 
[ActiveTriples](https://github.com/ActiveTriples/ActiveTriples) framework extension of 
[ruby-rdf/rdf](https://github.com/ruby-rdf/rdf).  The following models are provided:

1. LD4L::FoafRDF::Person - Implements the Person class in the FOAF ontology.  (extremely simple for holding rdf_subject only)


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
