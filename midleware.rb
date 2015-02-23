require 'securerandom'
class Res
  def initialize(nextapp)
    @nextapp=nextapp 
  end
  def call(env)
    begin
      @nextapp.call(env)
    rescue
      [500,{},["error"]]
    end
  end
end
class Image
  def initialize(nextapp)
    @nextapp=nextapp
  end
  def call(env)
    c,h,b=@nextapp.call(env) 
    r=Rack::Request.new(env)
    if r.path.split('.').last=='jpg'
      adr=r.path 
      if File.open(adr[1,adr.length])  
       [200,{'Content-Type'=>'image/jpeg'},File.open(adr[1,adr.length])]
      end
    else
      @nextapp.call(env)
    end
  end  
end
class Css
  def initialize(nextapp)
    @nextapp=nextapp
  end
  def call(env)
    c,h,b=@nextapp.call(env) 
    r=Rack::Request.new(env)
    if r.path.split('.').last=='css'
      adr=r.path 
      if File.open(adr[1,adr.length])    
        [200,{'Content-Type'=>'text/css'},File.open(adr[1,adr.length])]
      end
    else
      @nextapp.call(env)
    end
  end  
end   
class Session
  @@session = {}
  def initialize(nextapp)
    @nextapp = nextapp
  end
  def call(env)
    token=env['HTTP_COOKIE']
    unless @@session[token]
      token = generate_token
      @@session[token] = {}
    end
    env['session']=
    @nextapp.call(env)
  end
  private
  def generate_token
    SecureRandom.hex
  end
end




  
