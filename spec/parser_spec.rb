describe Parser do

  subject(:parser){described_class.new(File.dirname(File.absolute_path(__FILE__))+"/test_webserver.log")}

  describe '#initialize' do
    it 'will have an empty visits log array' do
      expect(parser.visits_log).to eq ([])
    end

    it 'will have a path' do
      expect(parser.path).to end_with('test_webserver.log')
    end
  end

  describe '#parse_file' do
    it 'will iterate over log file instiating a LoggedVisit in visits log' do
      parser.parse_file
      expect(parser.visits_log).to include (LoggedVisit)
    end
  end

  describe '#visits_by_page' do
    it 'groups visits by page' do
      parser.parse_file
      expect(parser.visits_by_page.size).to eq 6
    end
  end

end
