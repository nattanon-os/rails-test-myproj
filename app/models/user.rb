# app/models/user.rb
class User
  include Mongoid::Document
  field :name, type: String
  field :age, type: Integer
  field :address, type: String
end
