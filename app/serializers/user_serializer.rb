class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :password_digest, :user_type, :email
end
