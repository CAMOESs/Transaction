class Order < ApplicationRecord
  belongs_to :user
  has_many :ordered_lists
  has_many :items, through: :ordered_lists
  accepts_nested_attributes_for :ordered_lists

  def update_total_quantity
    ActiveRecord::Base.transaction do
      @order = Order.new
      @order.ordered_lists.lock.build
      @items = Item.all.order(:created_at)
    end
    end
  end
