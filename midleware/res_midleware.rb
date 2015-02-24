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
