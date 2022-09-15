require_relative 'concerns/define_article_policies'
require_relative 'concerns/define_article_scope'

class SurfboardPolicy < ApplicationPolicy
  include ArticlePolicies

  class Scope < Scope
    include DefineArticleScope
  end
end
