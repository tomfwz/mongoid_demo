class Person
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :notes, type: String
  field :_id, type: String, default: ->{ first_name }
  validates_presence_of :first_name

  embeds_many :articles
end
