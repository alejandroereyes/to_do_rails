class TodoController < ApplicationController

  def index
    render json: Todo.all, status: 200
  end # index
end
