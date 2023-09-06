class RestaurentSerializer < ActiveModel::Serializer
  attributes :id ,:name, :place ,:status 

  has_many :categories, serializer: CategorySerializer
  has_many :dishes, serializer: DishSerializer
end
