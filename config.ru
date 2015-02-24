require_relative 'store.rb'
require_relative 'midleware/res_midleware.rb'
require_relative 'midleware/static_midleware.rb'
require_relative 'midleware/session_midleware.rb'
use Rack::Reloader, 0 
#use Session
use Res
use Static
Product.new("Lenovo", 6500,"public/11.jpg", "Android 4.2 memory 8gb  camera 8mpx").save
Product.new("Samsung",3500,"http://i.allo.ua/media/catalog/product/cache/1/image/240x170/9df78eab33525d08d6e5fb8d27136e95/1/5/1544584.jpg","1").save
Product.new("Sony", 4800,"http://i.allo.ua/media/catalog/product/cache/1/image/240x170/9df78eab33525d08d6e5fb8d27136e95/s/o/sony-xperia-c-c2305-black.jpg ","1").save
Product.new("LG",4950,"http://i.allo.ua/media/catalog/product/cache/1/image/240x170/9df78eab33525d08d6e5fb8d27136e95/6/7/67586525.jpg","111").save
Product.new("HTC",4700,"http://i.allo.ua/media/catalog/product/cache/1/image/240x170/9df78eab33525d08d6e5fb8d27136e95/h/t/htc-desire-616-dual-sim-navy-1.jpg","1").save
run MyStore.new
