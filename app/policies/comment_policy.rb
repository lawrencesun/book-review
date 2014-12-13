class CommentPolicy < ApplicationPolicy
	attr_reader :current_user, :comment
  def initialize(current_user, comment)
    @current_user = current_user
    @comment = comment
  end

  def update?
    @current_user.try(:admin?) or @current_user == @comment.user
  end

  def destroy?
  	@current_user.try(:admin?) or @current_user == @comment.user
  end
end