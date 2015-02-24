require 'securerandom'
class Session
  @@session = {}
  def initialize(nextapp)
    @nextapp = nextapp
  end
  def call(env)
    c,h,b=@nextapp.call
    token=h['HTTP_COOKIE']
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




  
