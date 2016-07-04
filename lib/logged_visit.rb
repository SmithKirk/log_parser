class LoggedVisit

  attr_reader :page, :ip_address
  
  def initialize(page: page, ip_address: ip_address)
    @page = page
    @ip_address = ip_address
  end
end
