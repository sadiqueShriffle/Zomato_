# frozen_string_literal: true

class AddColumnToOrderItem < ActiveRecord::Migration[7.0]
  def change
    add_column :order_items, :quantity, :integer
  end
end
