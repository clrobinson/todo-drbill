require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.name' do
    it 'is required'
  end

  describe '.lists' do
    it 'returns lists'

    it 'destroys dependents'
  end

  describe '.authenticate' do
    it 'authenticates with the right password'

    it 'does not authenticate with the wrong password'
  end
end
