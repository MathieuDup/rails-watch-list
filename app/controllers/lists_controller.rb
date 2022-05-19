class ListsController < ApplicationController
  before_action :find_lists, only: %i[show]

  def index
    @lists = List.all
  end

  def show
    redirect_to list_path(@list)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render 'lists/new'
    end
  end

  # def edit
  #   redirect_to list_edit
  # end

  # def update
  #   @list.update(list_params)

  #   redirect_to lists_path
  # end

  # def destroy
  #   @list.destroy

  #   redirect_to lists_path
  # end

  private

  def find_lists
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
