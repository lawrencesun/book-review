class TopicPolicy < ApplicationPolicy
	attr_reader :current_user, :topic
  def initialize(current_user, topic)
    @current_user = current_user
    @topic = topic
  end

  def create?
    @current_user.try(:admin?)
  end

  def update?
    @current_user.try(:admin?)
  end

  def destroy?
  	@current_user.try(:admin?)
  end
end