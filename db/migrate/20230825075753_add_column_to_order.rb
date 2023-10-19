# frozen_string_literal: true

class AddColumnToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :total_amount, :integer
  end
end
