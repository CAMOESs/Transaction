class Order < ApplicationRecord
  belongs_to :user
  has_many :ordered_lists
  has_many :items, through: :ordered_lists
  accepts_nested_attributes_for :ordered_lists

  def update_total_quantity
    ActiveRecord::Base.transaction do
      @order = current_user.orders.lock.build(order_params)
      @order = current_user.orders.build(order_params)
      @order.save
      @order.update_total_quantity
    end
    end
  end
