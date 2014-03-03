module Slugable
  extend ActiveSupport::Concern

  included do

    validates :slug, format: {with: /\A[a-z0-9_]+\z/}, uniqueness: true, presence: true

    before_validation :generate_slug

    def generate_slug
      self.slug = title.downcase.gsub(/[^a-z0-9_]/, '_') unless slug?
    end

    def to_param
      slug
    end
  end
end