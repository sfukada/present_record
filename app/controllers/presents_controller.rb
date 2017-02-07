class PresentsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @presents = Present.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @present = Present.new
  end

  def create
    Present.create(user_type: present_params[:user_type],product_name: present_params[:product_name], product_price: present_params[:product_price], who_from: present_params[:who_from], who_from_other: present_params[:who_from_other], who_for: present_params[:who_for], who_for_other: present_params[:who_for_other], when: present_params[:when], when_other: present_params[:when_other],rate: present_params[:rate], text: present_params[:text],user_id: current_user.id, image: present_params[:image])
  end

  def show
    @present = Present.find(params[:id])
    @items = RakutenWebService::Ichiba::Item.search(keyword: @present.product_name)
  end

  def search
    if params[:product_name].present?
      @presents = Present.where('product_name LIKE(?)',"%#{params[:product_name]}%")
    end

    if params[:product_price].present?
    @presents = @presents.where(product_price < params[:product_price])
    end
  end

  private
  def present_params
    params.require(:present).permit(:user_type, :product_name, :image, :product_price, :who_from, :who_from_other, :who_for, :who_for_other, :when, :when_other,:rate, :text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
