require_relative '../app/models/user'

describe User do
  subject(:user){ described_class.new }

  describe '#authenticate' do
    it 'returns the user_id if authenticated' do
      alex_user = User.create(name: 'Alex', email:'Alex@Alex.com', password: '123', password_confirmation: '123')
      expect(alex_user.authenticate(123)).to eq alex_user.id
    end
  end
end
