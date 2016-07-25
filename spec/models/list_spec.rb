require 'rails_helper'

RSpec.describe List, type: :model do
  before do
    @user = User.create!(name: 'JonSnow', password: 'iknownothing')
    @list = @user.lists.create!(name: 'TestList')
  end

  describe '.name' do
    it 'can set a default name' do
      @list.update(name: nil)
      expect(@list.name).to_not be_blank
    end
  end

  describe '.user' do
    it 'is required' do
      @list.update(user: nil)
      expect(@list).to_not be_valid
    end
  end

  describe '.items' do
    before do
      @item = Item.create!(content: 'Item Content.', list_id: @list.id)
      @list.reload
    end

    it 'returns lists' do
      expect(@list.items).to include(@item)
    end

    it 'destroys dependents' do
      @list.destroy
      expect(Item.all.count).to eq(0)
    end
  end

  describe '#default_name' do
    it 'returns a string based on the date' do
      expect(List.default_name).to eq("List for #{Date.today.strftime('%b %d, %Y')}")
    end
  end
end
