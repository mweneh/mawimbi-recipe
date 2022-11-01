class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :description, :ingredients, :tutorial, :country, :serves, :user_id
end
