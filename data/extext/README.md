
# Schema.org External Extensions - admin section

data/extext/

This directory corresponds to schema.org external extensions.

These are structured data vocabularies managed elsewhere in the Web, that 
are to some degree aligned with schema.org's descriptive patterns and vocabulary.

See http://schema.org/docs/extension.html for more details.

In the simplest case, this could be a handful of terms that are very application-specific.
However an external extension could also be a large vocabulary which has its own 
mechanisms for community review, versioning etc.

In both cases, it is useful to be able to find such vocabulary from relevant schema.org
pages. To do so, schema.org needs to keep track of the URLs for terms and their relationship to 
corresponding schema.org terms.


## Structure

Status: work in progress

This mechanism will evolve based on feedback.

Each external enumeration corresponds to a subfolder of data/extext/ 

For each of these, we keep URLs in simple text files. Initially these pairs of schema.org term and 
remote term; we may at some point change the format and add explicit relationships e.g. subtype / supertype,
sub-property etc.



