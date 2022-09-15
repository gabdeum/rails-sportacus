require 'active_support/concern'

module DefineArticlePolicies
  extend ActiveSupport::Concern

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
