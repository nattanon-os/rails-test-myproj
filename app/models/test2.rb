require 'mongoid'
require 'symmetric-encryption'
class Test2
  # attr_encrypted :t1, random_iv: true
  include Mongoid::Document
  field :encrypted_t2_string, type: String,  encrypted: {random_iv: true, compress: true}
  field :t2, type: String
  field :t1, type: String
end
