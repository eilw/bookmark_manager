require_relative '../app/models/user'

describe User do
  let(:user){User.create(name: 'Alex', email:'Alex@Alex.com', password: '123', password_confirmation: '123')}

  describe '#authenticate' do
    it 'returns the user_id if authenticated' do
      expect(user.authenticate(123)).to eq user.id
    end

    it 'returns nil if incorrect information provided' do
      expect(user.authenticate(12345)).to be nil
    end
  end
end
