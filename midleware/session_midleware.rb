require 'securerandom'
class Session
  @@session = {}
  def initialize(nextapp)
    @nextapp = nextapp
  end
  def call(env)  
    r=Rack::Request.new(env)  
    token=env['HTTP_COOKIE'] #проверка токена
      if token==nil          #если пусто генерируем
        token = generate_token
        @@session[token] = {}
      else
        token=token.split('=').last  #отделил токен от "id="
      end  
    env['Set']=token #хеш для установки куки в Store
    unless @@session[token] #запись в сессию
      @@session[token]={'count visit' => 1,'last visit'=>Time.now}
    else
      if r.path=='/'
        unless @@session[token]['count visit']
          @@session[token]={'count visit' => 1,'last visit'=>Time.now}
        else
          @@session[token]['count visit']+=1
        end
      end
    end
env['session']='Last visit->'+@@session[token]['last visit'].to_s+' count visit->'+@@session[token]['count visit'].to_s
@@session[token]['last visit']=Time.now
@nextapp.call(env)
  end
  private
  def generate_token
    SecureRandom.hex
  end
end  
