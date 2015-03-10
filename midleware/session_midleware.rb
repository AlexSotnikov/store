require 'securerandom'
class Session
  @@session = {}
  def initialize(nextapp)
    @nextapp = nextapp
  end
  def call(env)
    token=env['HTTP_COOKIE'] #проверка токена    
    unless token         #если пусто генерируем
      token = generate_token
      @@session[token]=' ' 
      c,h,b=@nextapp.call(env)
      h['Session']=@@session[token]
      h['Set-Cookie']='token='+token+'; path=/;'
      [c,h,b]   
    else 
      token=token.split('=').last
      unless @@session[token]
        @@session[token]=' '
      end
      delet(token)
      env['Session']=@@session[token]
      @nextapp.call(env)   
    end
  end
  private
  def generate_token
    SecureRandom.hex
  end
  def delet(id)
    if @@session[id]
      del=@@session[id].split(',')
      if del.detect{|e| e=='delet'}
        @@session[id]=' '
      end
    end
  end
end  
