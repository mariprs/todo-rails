class TasksController < ApplicationController
 skip_before_action :verify_authenticity_token, only: [ :create, :toggle, :destroy ]
  def create
    list_group = ListGroup.find(params[:list_group_id])
    task = list_group.tasks.new(task_params)
    if task.save
      render json: task, status: :created
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  skip_before_action :verify_authenticity_token, only: [ :toggle ]

  def toggle
    task = Task.find(params[:id])
    task.completed = !task.completed
    if task.save
      render json: { message: "Tarefa atualizada!", task: task }
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
    end
  end


  def destroy
    task = Task.find(params[:id])
    if task.destroy
      render json: { message: "Tarefa deletada com sucesso!" }, status: :ok
    else
      render json: { erros: list_group.errors.full_messages }, status: :unprocessable_entity
    end
  end
  private

  def task_params
    params.require(:task).permit(:title, :subtitle, :completed)
  end
end
