class ListGroupsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [ :create, :destroy ]

  def index
    list_groups = ListGroup.includes(:tasks)
    render json: list_groups.to_json(include: :tasks)
  end

  def create
    list_group = ListGroup.new(list_group_params)
    if list_group.save
      render json: list_group, status: :created
    else
      render json: { errors: list_group.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    list_group = ListGroup.find(params[:id])
    if list_group.destroy
      render json: { message: "Lista deletada com sucesso!" }, status: :ok
    else
      render json: { errors: list_group.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def list_group_params
    params.require(:list_group).permit(:title, :subtitle)
  end
end
