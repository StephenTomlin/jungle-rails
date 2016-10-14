class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with :name => ENV['USERNAME'], :password => ENV['PASSWORD']
  def index
      @Categories = Category.order(id: :desc).all
  end

  def create
    @Category = Category.new(name: params[:category])
    if @Category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def destroy
    @Category = Category.find params[:id]
    @Category.destroy
    redirect_to [:admin, :categories], notice: 'Category deleted!'
  end

end