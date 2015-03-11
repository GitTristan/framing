class BlanksController < ApplicationController
  before_filter :ensure_authenticated

  def index
    @blanks = Blank.all
  end

  def new
    @blank = Blank.new
  end

  def create
    blank = Blank.create(shovel_params)
    redirect_to shovels_path, notice: "#{blank.name} created successfully!"
  end

  def show
    @blank = Blank.find(params[:id])
  end

  def edit
    @blank = Blank.find(params[:id])
  end

  def update
    blank = Blank.find(params[:id])
    blank.update(shovel_params)
    redirect_to shovel_path(blank), notice: "#{blank.name} updated successfully!"
  end

  def destroy
    blank = Blank.find(params[:id])
    blank.destroy
    redirect_to shovels_path, notice: "Deleted blank: #{blank.name}"
  end

private

  def shovel_params
    params.require(:blank).permit(:name, :quantity)
  end
end
