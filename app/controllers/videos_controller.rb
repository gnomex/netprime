class VideosController < ApplicationController
  before_action :ensure_owner, only: [:index]
  before_action :resource, except: [:index]
  before_action :new_resource, only: [:new]

  def index
    @collection = Video.by_user(current_user).
      default_order.page(page).per(per_page)
  end

  def show
    go_back if resource.nil?
  end

  def edit
  end

  def update
    if resource.update(resource_params)
      flash[:success] = t("messages.video.updated")

      redirect_to account_videos_path
    else
      render 'edit'
    end
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

  def add_view_count
    log_event

    resource.up_count

    render json: {
      message: "event received",
      count: resource.view_count
    }, status: 200
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

  def log_event
    Rails.logger.
      info("Received view count event from account #{params[:slug]}")
  end

  def account_params
    params[:account_slug]
  end

  def video_params
    params[:slug]
  end
end
