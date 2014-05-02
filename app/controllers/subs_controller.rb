class SubsController < ApplicationController

  def new
    @sub = Sub.new
    5.times { @sub.links.build }
  end

  def create
    @sub = current_user.subs.new(sub_params)
    @sub.links.build(link_params)

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      (5 - @sub.links.count).times { @sub.links.build }
      render :new
    end
  end

  def edit
    @sub = current_user.subs.find(params[:id])
    (5 - @sub.links.length).times { @sub.links.build }
  end

  def update
    @sub = current_user.subs.find(params[:id])

    link_params.each do |link_param|
      unless link_param[:id].blank?
        link = @sub.links.find(link_param[:id])
        link_param.delete(:id)
        if link_param.values.all?(&:blank?) || link_param[:destroy]
          link.destroy
          next
        end

        link.update_attributes(link_param)
        link
      else
        @sub.links.build(link_param)
      end
    end

    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      (5 - link_params.count).times { @sub.links.build }
      render :edit
    end

  end

  def show
    @sub = Sub.find(params[:id])
  end

  def index
    @subs = Sub.all
  end

  def destroy
    sub = Sub.find(params[:id])
    sub.destroy
    redirect_to subs_url
  end

  private

  def link_params
    params.permit(links: [:title, :body, :url, :_destroy, :submitter_id, :id])
          .require(:links)
          .values
          .reject do |ln|
            ln[:title].blank? && ln[:body].blank? && ln[:url].blank?
          end
  end

  def sub_params
    params.require(:sub).permit(:name,:user_id)
  end

end
