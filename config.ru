require_relative 'product.rb'
use Rack::Reloader, 0
Product.new("Lenovo", 6500, 5.5, "Android 4.3", 16, 13, "http://i.allo.ua/media/catalog/product/cache/1/image/240x170/9df78eab33525d08d6e5fb8d27136e95/v/i/vibe_z_product_tour_01.jpg").save
Product.new("Samsung",3500, 5.25, "Android 4.2", 8, 8, "http://i.allo.ua/media/catalog/product/cache/1/image/240x170/9df78eab33525d08d6e5fb8d27136e95/1/5/1544584.jpg").save
Product.new("Sony", 4800, 5, "Android 4.2", 4, 8, "http://i.allo.ua/media/catalog/product/cache/1/image/240x170/9df78eab33525d08d6e5fb8d27136e95/s/o/sony-xperia-c-c2305-black.jpg ").save
Product.new("LG",4950, 5,"Android 4.4",8,8,"http://i.allo.ua/media/catalog/product/cache/1/image/240x170/9df78eab33525d08d6e5fb8d27136e95/6/7/67586525.jpg").save
Product.new("HTC",4700, 5,"Android 4.2",4,8,"http://i.allo.ua/media/catalog/product/cache/1/image/240x170/9df78eab33525d08d6e5fb8d27136e95/h/t/htc-desire-616-dual-sim-navy-1.jpg").save
run MyStore.new
