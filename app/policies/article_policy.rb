class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def index?
    user
  end

  def show?
    true
  end

  def create?
    user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
