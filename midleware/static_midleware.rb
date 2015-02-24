class Static
  def initialize(nextapp)
    @nextapp=nextapp
  end
  def call(env)
    c,h,b=@nextapp.call(env) 
    r=Rack::Request.new(env)
    adr=r.path 
    case r.path.split('.').last
      when 'css'
        if File.open(adr[1,adr.length])    
          [200,{'Content-Type'=>'text/css'},File.open(adr[1,adr.length])]
        end
      when 'jpg'
        if File.open(adr[1,adr.length])    
          [200,{'Content-Type'=>'image/jpeg'},File.open(adr[1,adr.length])]
        end
      else
        [c,h,b]
    end
  end  
end  
