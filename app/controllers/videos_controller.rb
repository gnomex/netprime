class VideosController < ApplicationController
  protect_from_forgery with: :exception

  before_action :resource, only: [:show, :delete]
  before_action :new_resource, only: [:new]

  def index
    @collection = Video.by_user(current_user).page(page).per(per_page)
  end

  def show

  end

  def new
  end

  def create
    @resource = current_user.videos.build(resource_params)

    if @resource.save
      redirect_to account_videos_path, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def destroy
    resource&.destroy

    flash[:success] = t('defaults.actions.destroyed', resource_name: "Video")

    redirect_to account_videos_path
  end

  private

  def new_resource
    @resource = Video.new
  end

  def resource
    @resource ||= Video.find_by(slug: video_params)
  end

  def resource_params
    params.require(:video).permit(:name, :url)
  end

  def video_params
    params[:slug]
  end
end
