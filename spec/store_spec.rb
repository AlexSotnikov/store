require_relative 'spec_helper'
require_relative '../store'
require 'rack'
describe MyStore do
lamda{|env| ["CONTENT_LENGTH"=>"50", "CONTENT_TYPE"=>"application/x-www-form-urlencoded", "GATEWAY_INTERFACE"=>"CGI/1.1", "PATH_INFO"=>"/order", "QUERY_STRING"=>"", "REMOTE_ADDR"=>"127.0.0.1", "REMOTE_HOST"=>"localhost", "REQUEST_METHOD"=>"POST", "REQUEST_URI"=>"http://localhost:9292/order", "SCRIPT_NAME"=>"", "SERVER_NAME"=>"localhost", "SERVER_PORT"=>"9292", "SERVER_PROTOCOL"=>"HTTP/1.1", "SERVER_SOFTWARE"=>"WEBrick/1.3.1 (Ruby/2.2.0/2014-12-25)", "HTTP_HOST"=>"localhost:9292", "HTTP_USER_AGENT"=>"Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:36.0) Gecko/20100101 Firefox/36.0", "HTTP_ACCEPT"=>"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8", "HTTP_ACCEPT_LANGUAGE"=>"ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3", "HTTP_ACCEPT_ENCODING"=>"gzip, deflate", "HTTP_REFERER"=>"http://localhost:9292/order", "HTTP_COOKIE"=>"token=e2382a356a962647dcd9477cbdb4f654", "HTTP_CONNECTION"=>"keep-alive", "rack.version"=>[1, 3], "rack.input"=>#>, "rack.errors"=>#>>, "rack.multithread"=>true, "rack.multiprocess"=>false, "rack.run_once"=>false, "rack.url_scheme"=>"http", "rack.hijack?"=>true, "rack.hijack"=>#, "rack.hijack_io"=>nil, "HTTP_VERSION"=>"HTTP/1.1", "REQUEST_PATH"=>"/order", "rack.tempfiles"=>[], "Session"=>" Lenovo=6500,Sony=4800,delet,", "rack.request.query_string"=>"", "rack.request.query_hash"=>{}, "rack.request.form_hash"=>{"order"=>"wertg", "adres"=>"hjkl", "sub"=>"sub total is -- 11300.0"}, "rack.request.form_vars"=>"order=wertg&adres=hjkl&sub=sub+total+is+--+11300.0", "rack.request.form_input"=>#>, "controller"=>OrderController, "action"=>"accepted"]}
  it 'call' do
    MyStore.new.call(env)
  end
end
  
