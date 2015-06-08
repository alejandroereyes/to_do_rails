class TodoController < ApplicationController

  def index
    render 'index.html.erb', locals: { todo: Todo.all }
  end # index

  def create
      render json: Todo.create(entry: params[:entry]), status: 200
  end # create

  def update
    begin
      todo = Todo.find(params[:id])
      if !(params.has_key?(:entry))
        todo.completed = params[:completed]
        todo.save
        render json: Todo.find(params[:id]), status: 200
      elsif params.has_key?(:entry)
        todo = Todo.find(params[:id])
        todo.entry = params[:entry]
        todo.save
        render json: Todo.find(params[:id]), status: 200
      end
    rescue ActiveRecord::RecordNotFound => error
      render json: {error: error.message}, status: 404
    end
  end

  def destroy
    if Todo.exists?(id: params[:id])
      Todo.delete(params[:id])
      render 'index.html.erb', locals: { todo: Todo.all }
    else
      render json: {error: "Entry Not Found"}, status: 404
    end
  end

  def show
    begin
      render 'show.html.erb', locals: { todo: Todo.find(params[:id]) }
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
