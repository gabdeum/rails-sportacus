require 'active_support/concern'

module HasCharacteristic
  extend ActiveSupport::Concern

  included do
    has_one :characteristic, class_name: "#{name}Characteristic", foreign_key: :article_id, dependent: :destroy
    # geocoded_by :address
    # after_validation :geocode, if: :will_save_change_to_address?
  end

  def policy_class
    ArticlePolicy
  end
end
