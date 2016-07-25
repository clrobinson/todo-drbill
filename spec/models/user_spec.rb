require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create!(name: 'JonSnow', password: 'iknownothing')
  end

  describe '.name' do
    it 'is required' do
      @user.update(name: '')
      expect(@user).to_not be_valid
    end
  end

  describe '.lists' do
    before do
      @list = List.create!(name: 'NewList', user_id: @user.id)
      @user.reload
    end

    it 'returns lists' do
      expect(@user.lists).to include(@list)
    end

    it 'destroys dependents' do
      @user.destroy
      expect(List.all.count).to eq(0)
    end
  end

  describe '.authenticate' do
    it 'authenticates with the right password' do
      expect(@user.authenticate('iknownothing')).to eq(@user)
    end

    it 'does not authenticate with the wrong password' do
      expect(@user.authenticate('wrongpass')).to be_falsey
    end
  end
end
