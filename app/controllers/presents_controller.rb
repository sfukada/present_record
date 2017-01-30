class PresentsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @presents = Present.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @present = Present.new
  end

  def create
    Present.create(user_type: present_params[:user_type],product_name: present_params[:product_name], image: present_params[:image], product_price: present_params[:product_price], who_from: present_params[:who_form], who_from_other: present_params[:who_from_other], who_for: present_params[:who_for], who_for_other: present_params[:who_for_other], when: present_params[:when], when_other: present_params[:when_other],rate: present_params[:rate], text: present_params[:text],user_id: current_user.id)
  end

  private
  def present_params
    params.require(:present).permit(:user_type, :product_name, :image, :product_price, :who_form, :who_from_other, :who_for, :who_for_other, :when, :when_other,:rate, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
