class TodoController < ApplicationController

  def index
    render json: Todo.all, status: 200
  end # index

  def create
      render json: Todo.create(entry: params[:entry]), status: 200
  end # create

  def destroy
    if Todo.exists?(id: params[:id])
      Todo.delete(params[:id])
      render json: {message: "Entry Deleted"}, status: 200
    else
      render json: {error: "Entry Not Found"}, status: 404
    end
  end

  def show
    begin
      render json: Todo.find(params[:id]), status: 200
    rescue ActiveRecord::RecordNotFound => error
      render json: {error: error.message}, status: 404
    rescue StandardError => error
      render json: {error: error.message}, status: 418
    end
  end # show

  def new
    render json: Todo.new, status: 200
  end
end # class
