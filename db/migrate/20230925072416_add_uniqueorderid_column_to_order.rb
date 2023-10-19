# frozen_string_literal: true

class AddUniqueorderidColumnToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :unique_order_id, :string
  end
end
