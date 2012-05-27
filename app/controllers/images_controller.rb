class ImagesController < ApplicationController
  before_filter :authenticate_user!
  
  include ApplicationHelper
  helper_method :sort_column, :sort_direction  

  def new
    @image = current_user.images.build
    @title = "Upload image"
  end
  
  def create
    @image = current_user.images.new(params[:image])
    if @image.save
      flash[:notice] = "Image successfully saved."
      redirect_to "/my-images"
    else
      unless @image.errors.include?(:photo)
        flash[:error] = "#{@image.errors.first[0].to_s.gsub(/_/, " ").capitalize} #{@image.errors.first[1]}"
      end
      @title = "Upload image"
      render :action => :new 
    end
  end
  
  def index
    @images = current_user.images.paginate(:page => params[:page], :per_page => 5)
                                 .order(sort_column + " " + sort_direction)
    @title = "My images | Total #{@images.count}."
  end
  
  def destroy
    unless params[:id]
      flash[:error] = "Image not selected."
    else
      image = current_user.images.find(params[:id])
      unless image
        flash[:error] = "Selected image not exists."
      else
        image.delete
        flash[:notice] = "Image deleted successfully."
      end
    end
    
    redirect_to '/my-images'
  end
  
  private
  
    def sort_column
      Image.column_names.include?(params[:sort]) ? params[:sort] : "id"  
    end
    
    def sort_direction
      params[:direction] || "desc"  
    end  
end
