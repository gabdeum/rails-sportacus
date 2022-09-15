require 'active_support/concern'

module DefineArticleScope
  extend ActiveSupport::Concern

  def resolve
    scope.where(user: user)
  end
end
