class UserPresenter < BasePresenter
  def user_name
    resource&.name
  end

  def headline
    user_name || user_email.split('@').first
  end

  def user_email
    resource.email
  end

  def registration_date
    localize_datetime(resource.created_at)
  end

  def most_popular_video
    @video ||= begin
      video = resource.videos.default_order.first

      video.view_count.zero? ? nil : video
    end
  end

  def total_of_videos
    resource.videos.size
  end

  def sum_of_view_count
    "#{videos_view_count} views"
  end

  def videos_view_count
    videos.map(&:view_count).sum
  end

  def videos
    resource.videos
  end
end
