# frozen_string_literal: true

class AddColumnToDish < ActiveRecord::Migration[7.0]
  def change
    add_column :dishes, :dish_type, :string
  end
end
