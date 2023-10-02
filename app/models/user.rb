class User < ApplicationRecord
  has_secure_password

  has_many :transactions, foreign_key: :author_id
end
