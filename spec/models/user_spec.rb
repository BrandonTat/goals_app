require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryGirl.build(:user) }

  describe 'validations' do
    it { should validate_presence_of (:user_name) }
    it { should validate_presence_of (:password_digest) }
    it { should validate_uniqueness_of (:user_name) }
    it { should validate_length_of(:password).is_at_least(6) }

    it 'creates a password digest when a password is given' do
      expect(user.password_digest).to_not be_nil
    end

    it 'creates a session token before validation' do
      expect(user.session_token).to_not be_nil
    end
end
