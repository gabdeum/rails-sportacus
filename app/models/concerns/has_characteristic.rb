require 'active_support/concern'

module HasCharacteristic
  extend ActiveSupport::Concern

  included do
    has_one :characteristic, class_name: "#{name}Characteristic", foreign_key: :article_id
  end
end
