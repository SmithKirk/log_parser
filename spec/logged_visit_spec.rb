describe LoggedVisit do

  subject(:visit){described_class.new(page: '/contact', ip_address: '184.123.665.067')}

  describe '#initialize' do
    it 'will have a page' do
      expect(visit.page).to eq ('/contact')
    end

    it 'will have an ip_address' do
      expect(visit.ip_address).to eq ('184.123.665.067')
    end
  end
end
