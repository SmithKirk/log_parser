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

  context 'after log has been parsed' do
    before do
      parser.parse_file
    end

    describe '#parse_file' do
      it 'will iterate over log file instiating a LoggedVisit in visits log' do
        expect(parser.visits_log).to include (LoggedVisit)
      end
    end

    describe '#visits_by_page' do
      it 'groups visits by page' do
        expect(parser.visits_by_page.size).to eq 4
      end
    end

    describe '#visits_by_page_counted_and_ordered' do
      it 'will order pages by visit count' do
        parser.visits_by_page_counted_and_ordered
        expect(parser.visits_by_page_counted_and_ordered.size).to eq 4
      end
    end

    describe '#print_page_visits' do
      it 'will display list of pages visited' do
        expect(parser.print_page_visits).to eq ("/help_page/1 3 visits\n/home 2 visits\n/about 2 visits\n/contact 1 visits\n")
      end
    end

    # describe '#unique_visits_counted_and_ordered' do
    #   it 'will order pages by unique visits' do
    #
    #   end
    # end
  end
end
