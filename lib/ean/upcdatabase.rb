#nothing useful here yet.  For future version
require 'xmlrpc/client'

server = XMLRPC::Client.new2('http://www.upcdatabase.com/rpc')
@item = server.call('lookupUPC', '720642442524')

# puts @item
# => {"issuerCountry"=>"United States", "message"=>"Database entry found", "size"=>"CD", "pendingUpdates"=>0, "lastModified"=>"2001-06-24 15:17:47", "found"=>true, "mfr_comment"=>"Manufacturer is not known", "issuerCountryCode"=>"us", "description"=>"Nirvana - Nevermind", "ean"=>"0720642442524", "upc"=>"720642442524", "isCoupon"=>false}

# puts "Description :: " + @item["description"]
# puts "Type        :: " + @item["size"]