class ItemsController < ApplicationController
  before_action :restrict_access
  before_action :set_item
  before_action :ensure_list_ownership

  def create
    #
  end

  def update
    #
  end

  def destroy
    #
  end

  protected

    def set_item
      @item = Item.find(params['id'])
    end

    def ensure_list_ownership
      unless current_user.lists.include?(@item.list)
        render 'sessions/sign_out' and return
      end
    end

end