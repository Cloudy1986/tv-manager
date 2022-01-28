require 'show'

describe Show do
  
  describe '.all' do
    it 'returns a list of the shows' do
      shows = Show.all
      expect(shows).to include('The Wire')
      expect(shows).to include('The Sopranos')
      expect(shows).to include('Fargo')
    end
  end

end