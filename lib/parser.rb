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

  def visits_by_page_counted_and_ordered
    visits_by_page.map { |page, visits| [page, visits.count]}.sort{ |a, b| b[-1] <=> a[-1]}
  end

  def print_page_visits
  print_result = ""
  visits_by_page_counted_and_ordered.each do|page, visits|
      print_result += "#{page} #{visits} visits\n"
    end
    print_result
  end

end
