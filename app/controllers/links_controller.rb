class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.sub
    if @link.save
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end

  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
      @link = Link.find(params[:id])

    if @link.update_attributes(link_params)
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :edit
    end
  end

  def destroy
    link = Link.find(params[:id])
    link.destroy
    redirect_to subs_url
  end

  private

  def subs_params
    params.require(:sub).permit(sub_ids: [])
  end

  def link_params
    params.require(:link).permit(:title, :url, :body)
  end
end
