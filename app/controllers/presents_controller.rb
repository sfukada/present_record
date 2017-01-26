class PresentsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @presents = Present.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @present = Present.new
  end

  def create
    Present.create(present_params)
  end

  private
  def present_params
    params.permit()
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
