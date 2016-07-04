class Parser

  attr_accessor :visits_log, :path

  def initialize(path)
    @path = path
    @visits_log = []
  end

  def parse_file
    File.read(path).each_line do
      |line| page, ip_address = line.split
      @visits_log.push(LoggedVisit.new(page: page, ip_address: ip_address))
    end
  end

  def visits_by_page
    @visits_by_page = visits_log.group_by{ |visit| visit.page}
  end

end
