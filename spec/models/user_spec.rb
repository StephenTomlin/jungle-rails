require 'rails_helper'

RSpec.describe User, type: :model do
  context 'description' do
    before do
      @user = User.create(
        name: 'Stephen',
        email: 'Stephen@email.com',
        password: 'itbelikeitis',
        password_confirmation: 'itbelikeitis'
      )
    end
    it ' be passwords have to be like it is but it' do
      expect(@user.password).to eq(@user.password_confirmation)
    end
    it 'password be greater than or equal to 2' do
      expect(@user.password.length).to be >= 2
    end
    it 'can only have unique email' do
      @user2 = User.create(
        name: 'user2',
        email: 'what.com',
        password: 'itbelikeitis',
        password_confirmation: 'itbelikeitis',
      )
      expect(@user.email.downcase.strip).not_to eq(@user2.email.downcase.strip)
    end
  end
end