class RestaurentSerializer < ActiveModel::Serializer
  attributes :id ,:name, :place ,:status 

   has_many :categories
  # has_many :dishes
end
