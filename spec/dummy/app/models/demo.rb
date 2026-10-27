# frozen_string_literal: true

class Demo
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :field, :string

  validates :field, presence: true
end
