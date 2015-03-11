class BlanksController < ApplicationController
  before_filter :ensure_authenticated

  def index
    @blanks = Blank.all
  end

  def new
    @blank = Blank.new
  end

  def create
    blank = Blank.create(blank_params)
    redirect_to blanks_path, notice: "#{blank.name} created successfully!"
  end

  def show
    @blank = Blank.find(params[:id])
  end

  def edit
    @blank = Blank.find(params[:id])
  end

  def update
    blank = Blank.find(params[:id])
    blank.update(blank_params)
    redirect_to blank_path(blank), notice: "#{blank.name} updated successfully!"
  end

  def destroy
    blank = Blank.find(params[:id])
    blank.destroy
    redirect_to blanks_path, notice: "Deleted blank: #{blank.name}"
  end

private

  def blank_params
    params.require(:blank).permit(:name, :quantity)
  end
end
