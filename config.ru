require_relative 'store.rb'
require_relative 'midleware/res_midleware.rb'
require_relative 'midleware/static_midleware.rb'
require_relative 'midleware/session_midleware.rb'
use Rack::Reloader, 0 
use Res
use Static
use Session
Product.new("Lenovo", 6500,"public/1.jpg", "Android 4.2 memory 8gb  camera 8mpx").save
Product.new("Samsung",3500,"public/2.jpg","Android 4.2 memory 4gb  camera 3mpx").save
Product.new("Sony", 4800,"public/3.jpg ","Android 4.1 memory 8gb  camera 8mpx").save
Product.new("LG",4950,"public/4.jpg","Android 4.3 memory 8gb  camera 12mpx").save
Product.new("HTC",4700,"public/5.jpg","Android 4.5 memory 8gb  camera 12mpx").save
run MyStore.new
