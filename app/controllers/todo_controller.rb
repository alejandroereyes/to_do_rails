class TodoController < ApplicationController

  def index
    render json: Todo.all, status: 200
  end # index

  def new
    render json: Todo.new, status: 200
  end
end
