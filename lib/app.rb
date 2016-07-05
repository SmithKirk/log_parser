require_relative 'parser'

parser = Parser.new(ARGV)

parser.parse_file

puts "list of webpages with most page views:\n#{parser.print_page_visits}"

puts "list of webpages with most unique page views:\n#{parser.print_page_unique_visits}"
