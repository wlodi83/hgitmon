class GirlsController < ApplicationController
  before_filter :check_admin_logged_in!, :except => [:show, :index]
  before_filter :check_user_logged_in!, :only => [:show]
  
  def admin
    @girls = Girl.all
  end
 
  def index
    @girls = Girl.all
  end

  def new
    @girl = Girl.new
  end

  def show
    @girl = Girl.find(params[:id])
  end

  def create
    @girl = Girl.create(params[:girl])
    if @girl.save
      redirect_to girl_path(@girl)
    else
      render :action => 'new'
    end
  end

  def edit
   @girl = Girl.find(params[:id])
  end

  def update
    @girl = Girl.find(params[:id])
    if @girl.update_attributes(params[:girl])
      redirect_to girl_path(@girl) 
    else
      render :action => 'edit'
    end
  end

  def destroy
    Girl.find(params[:id]).destroy
    redirect_to girls_path
  end

  private
    
  def check_admin_logged_in! # admin must be logged in
    authenticate_admin!
  end

  def check_user_logged_in! # if admin is not logged in, user must be logged in
    if !admin_signed_in?
      authenticate_user!
    end   
  end
end
