class Workflow
  include Mongoid::Document
  field :name, type: String
  field :content
end
