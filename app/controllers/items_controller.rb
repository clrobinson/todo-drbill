class ItemsController < ApplicationController
  before_action :restrict_access
  before_action :set_item, except: [:create]
  before_action :ensure_list_ownership, except: [:create]

  def create
    @item = Item.new(item_params)
    (render 'create_error' and return) if not @item.save
  end

  def update
    (render 'update_error' and return) if not @item.update(item_params)
  end

  def destroy
    @item_id = @item.id
    (render 'destroy_error' and return) if not @item.destroy
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

    def item_params
      params.require(:item).permit(:content, :due_date, :done, :list_id)
    end

end