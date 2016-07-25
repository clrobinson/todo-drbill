require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '.content' do
    it 'is required'

    it 'formats whitespace'
  end

  describe '.due_date' do
    it 'is optional'
  end

  describe '.done' do
    it 'defaults to false'

    it 'clears .due_date when true'
  end

  describe '.list' do
    it 'is required'
  end

  describe '.overdue?' do
    context 'without a due date' do
      it 'returns nil'
    end

    context 'today is after due date' do
      it 'returns true'
    end

    context 'today is on due date' do
      it 'returns false'
    end

    context 'today is before due date' do
      it 'returns false'
    end
  end

  describe '.sortstamp' do
    context 'without a due date' do
      context 'and is done' do
        it 'returns a unique sorting integer'
      end

      context 'and is not done' do
        it 'returns a unique sorting integer'
      end
    end

    context 'with a due date' do
      context 'and is overdue' do
        it 'returns a simplified sorting integer'
      end

      context 'and is not overdue' do
        it 'returns a simplified and doubled sorting integer'
      end
    end
  end

end
