require_relative '../models/user'

describe User do
  # subject(:user){described_class.new}

  describe '#login' do
    it 'sends to the right location if login is correct' do
      subject.password = 'weak'
      expect(subject.login('weak')).to eq '/links'
    end
  end
end
