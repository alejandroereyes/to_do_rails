class TodoController < ApplicationController

  def index
    render json: Todo.all, status: 200
  end # index

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
