class BookPolicy < ApplicationPolicy
	attr_reader :current_user, :book
  def initialize(current_user, book)
    @current_user = current_user
    @book = book
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