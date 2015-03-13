require_relative 'Teamplate.rb'
class Controller

  attr_accessor :headers

  def initialize
    @response = Rack::Response.new
    @headers = {'Content-type' => 'text/html'}
  end

  def call(env)
    @env = env
    @request = Rack::Request.new(env)
    self.send(env['action'])
    @headers.each { |k, v| @response[k] = v }
    @response.finish
  end

  def get_binding
    binding
  end

  private

  def render(view, locals ,status=200)
    @response.status = status
    @response.write Template.new(self).render("#{view}.html.erb", locals)
  end

  def redirect_to(url)
    @response.status = 302
    @headers['Location'] = url
  end

  def params
    @_params = (@request.params.merge(@env['url_params'] || {}))
  end

  def session(k='Session')
    unless block_given?
      @env[k]
    else
      @env[k] << yield
    end
  end
end 
    
