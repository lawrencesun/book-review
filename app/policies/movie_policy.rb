class MoviePolicy < ApplicationPolicy
	attr_reader :current_user, :movie
  def initialize(current_user, movie)
    @current_user = current_user
    @movie = movie
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