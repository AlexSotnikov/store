require_relative 'spec_helper'
require_relative '../store'
describe MyStore do
  it 'call' do
    MyStore.new.call({"GATEWAY_INTERFACE"=>"CGI/1.1", "PATH_INFO"=>"/", "QUERY_STRING"=>"", "REMOTE_ADDR"=>"127.0.0.1", "REMOTE_HOST"=>"localhost", "REQUEST_METHOD"=>"GET", "REQUEST_URI"=>"http://localhost:9292/", "SCRIPT_NAME"=>"", "SERVER_NAME"=>"localhost", "SERVER_PORT"=>"9292", "SERVER_PROTOCOL"=>"HTTP/1.1", "SERVER_SOFTWARE"=>"WEBrick/1.3.1 (Ruby/2.2.0/2014-12-25)", "HTTP_HOST"=>"localhost:9292", "HTTP_USER_AGENT"=>"Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:35.0) Gecko/20100101 Firefox/35.0", "HTTP_ACCEPT"=>"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8", "HTTP_ACCEPT_LANGUAGE"=>"ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3", "HTTP_ACCEPT_ENCODING"=>"gzip, deflate", "HTTP_REFERER"=>"http://localhost:9292/lenovo", "HTTP_CONNECTION"=>"keep-alive", "HTTP_CACHE_CONTROL"=>"max-age=0"}).should eq(is_a?(Array))
  end
end
  
