
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
    descending_sort(visits_by_page.map do |page, visits|
      [page, visits.count]
    end)
  end

  def unique_visits_by_page
    descending_sort(visits_by_page.map do |page, visits|
       [page, visits.map{|obj| obj.ip_address}.uniq.count]
    end)
  end

  def print_page_visits
  print_result = ""
  
  visits_by_page_counted_and_ordered.each do|page, visits|
      print_result += "#{page} #{visits} visits\n"
    end
    print_result
  end

  private
  def descending_sort(array)
    array.sort{ |a, b| b[-1] <=> a[-1]}
  end

end
