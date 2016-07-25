require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = User.create!(name: 'JonSnow', password: 'iknownothing')
    @list = @user.lists.create!(name: 'TestList')
    @item = @list.items.create(content: "Item test content.")
  end

  describe '.content' do
    it 'is required' do
      @item.update(content: nil)
      expect(@item).not_to be_valid
    end

    it 'formats whitespace' do
      @item.update(content: "  New item    test content.   ")
      @item.reload
      expect(@item.content).to eq("New item test content.")
    end
  end

  describe '.due_date' do
    it 'can be nil' do
      @item.update(due_date: nil)
      expect(@item).to be_valid
    end

    it 'can be a Date' do
      @item.update(due_date: Date.today)
      expect(@item).to be_valid
    end
  end

  describe '.done' do
    it 'defaults to false' do
      new_item = @list.items.create(content: "Item test content.")
      expect(new_item.done).to be_falsey
    end

    it 'clears .due_date when true' do
      @item.update(due_date: Date.today)
      @item.update(done: true)
      expect(@item.due_date).to be_nil
    end
  end

  describe '.list' do
    it 'is required' do
      @item.update(list: nil)
      expect(@item).to_not be_valid
    end
  end

  describe '.overdue?' do
    context 'without a due date' do
      it 'returns nil' do
        @item.update(due_date: nil)
        expect(@item.overdue?).to be_nil
      end
    end

    context 'today is after due date' do
      it 'returns true' do
        @item.update(due_date: 2.days.ago.to_date)
        expect(@item.overdue?).to be_truthy
      end
    end

    context 'today is on due date' do
      it 'returns false' do
        @item.update(due_date: Date.today)
        expect(@item.overdue?).to be_falsey
      end
    end

    context 'today is before due date' do
      it 'returns false' do
        @item.update(due_date: 2.days.from_now.to_date)
        expect(@item.overdue?).to be_falsey
      end
    end
  end

  describe '.sortstamp' do
    context 'without a due date' do
      context 'and is done' do
        it 'returns a unique sorting integer' do
          @item.update(due_date: nil, done: true)
          expect(@item.sortstamp).to eq(200000001)
        end
      end

      context 'and is not done' do
        it 'returns a unique sorting integer' do
          @item.update(due_date: nil, done: false)
          expect(@item.sortstamp).to eq(200000000)
        end
      end
    end

    context 'with a due date' do
      context 'and is overdue' do
        it 'returns a simplified sorting integer' do
          @item.update(due_date: 2.days.ago.to_date)
          result = (@item.due_date.to_time.to_i * 0.01).floor
          expect(@item.sortstamp).to eq(result)
        end
      end

      context 'and is not overdue' do
        it 'returns a simplified and doubled sorting integer' do
          @item.update(due_date: 2.days.from_now.to_date)
          result = (@item.due_date.to_time.to_i * 0.02).floor
          expect(@item.sortstamp).to eq(result)
        end
      end
    end
  end

end
