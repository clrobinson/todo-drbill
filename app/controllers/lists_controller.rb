class ListsController < ApplicationController
  before_action :restrict_access
  before_action :set_list, except: [:index, :create]

  def index
  end

  def show
  end

  def create
    @list = current_user.lists.new(list_params)
    (render 'create_error' and return) if not @list.save
  end

  def update
    (render 'update_error' and return) if not @list.update(list_params)
  end

  def destroy
    @list_id = @list.id
    (render 'destroy_error' and return) if not @list.destroy
  end

  protected

    def list_params
      params.require(:list).permit(:name)
    end

    def set_list
      @list = List.find(params['id'])
    end

end