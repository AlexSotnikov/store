require 'erb'
class Template
  def initialize(controller)
    @controller = controller
  end

  def render(template, locals = nil)
    view = erb(template).result(@controller.get_binding)
    if locals
      erb(locals).result(@controller.get_binding { view })
    else
      view
    end
  end

  private

  def erb(view)
    ERB.new(File.read(view))
  end
end 
