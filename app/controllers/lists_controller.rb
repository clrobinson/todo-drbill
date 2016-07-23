class ListsController < ApplicationController
  before_action :restrict_access
  before_action :set_list, except: [:create]

  def show
  end

  def create
    @list = List.new(list_params)
    (render 'create_error' and return) if not @list.save
  end

  def update
    #
  end

  def destroy
    #
  end

  protected

    def list_params
      params.require(:list).permit(:name)
    end

    def set_list
      @list = List.find(params['id'])
    end

end