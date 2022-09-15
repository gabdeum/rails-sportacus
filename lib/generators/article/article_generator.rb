class ArticleGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)
  argument :model_arguments, type: :array, default: [], banner: 'field[:type][:index] field[:type][:index]'
  def create_article_subclass_and_properties_model
    model_argument_with_article_references = model_arguments.unshift('article:references').join(' ')
    generate 'model', name + '_characteristic ' + model_argument_with_article_references
    generate 'pundit:policy', name
    create_file "app/models/#{file_name}.rb", <<~FILE
      class #{class_name} < Article
        include HasCharacteristic
      end
    FILE
    gsub_file "app/policies/#{file_name}_policy.rb", /(.|\n)*/, "
    require_relative 'concerns/define_article_policies'
    require_relative 'concerns/define_article_scope'

    class #{class_name}Policy < ApplicationPolicy
      include ArticlePolicies

      class Scope < Scope
        include DefineArticleScope
      end
    end
    "
  end
end
