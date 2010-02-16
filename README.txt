= ean

* http://blog.nanorails.com/ean-upc
* http://rubyforge.org/projects/ean/

== DESCRIPTION:

Provide validation/generation for UPC/EAN/GTIN numbers

== FEATURES/PROBLEMS:

* Validate UPC/EAN/GTIN identifiers

* Generate check number for UPC/EAN/GTIN identifiers

== SYNOPSIS:

  require "rubygems"
  require "ean"

  "1234567890128".to_gtin
  
  "1-234567-890128".ean?

  "1234567890128".to_gtin.ean?

  "784794001602".generate_check_digit

== REQUIREMENTS:

* hoe 1.5 (to rebuild)

== INSTALL:

* sudo gem install ean

== SOURCE CODE
http://gitorious.org/ean
http://github.com/psq/ean