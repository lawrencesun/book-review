class VideoPolicy < ApplicationPolicy
	attr_reader :current_user, :video
  def initialize(current_user, post)
    @current_user = current_user
    @video = video
  end

  def update?

  end

  def destroy?

  end
end