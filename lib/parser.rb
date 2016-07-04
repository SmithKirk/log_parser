class Parser

  attr_accessor :visits_log, :path

  def initialize(path)
    @path = path
    @visits_log ||= []
  end

end
