class TodoController < ApplicationController

  def index
    render json: Todo.all, status: 200
  end # index

  def create
    if Todo.exists?(params[:id])
      render json: {error: 'item at #{params[:id]} id already exists'}, status: 422
    else
      Todo.create(entry: params[:entry])
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
  end

  def new
    render json: Todo.new, status: 200
  end
end
