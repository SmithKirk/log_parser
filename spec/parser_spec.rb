describe Parser do

  subject(:parser){Parser.new(File.dirname(File.absolute_path(__FILE__))+"/test_webserver.log")}
  let(:test_log){double ("test_log")}

  describe '#initialise' do
    it 'visits log should be empty' do
      expect(parser.visits_log).to eq ([])
    end

    it 'should have a path' do
      expect(parser.path).to end_with('test_webserver.log')
    end
  end

end
