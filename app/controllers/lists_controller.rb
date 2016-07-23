class ListsController < ApplicationController
  before_action :restrict_access
  before_action :set_list

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

    def set_list
      @list = list.find(params['id'])
    end

end