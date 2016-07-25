require 'rails_helper'

RSpec.describe List, type: :model do
  describe '.name' do
    it 'is required'

    it 'can set a default name upon creation'
  end

  describe '.user' do
    it 'is required'
  end

  describe '.items' do
    it 'returns items'

    it 'destroys dependents'
  end

  describe '#default_name' do
    it 'returns a string based on the date'
  end
end
