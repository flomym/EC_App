class Order < ApplicationRecord
    has_many :line_items, :dependent => :delete_all
    enum status: {
        cart: 0,
        checked_out: 1
    }

    before_create do
        self.status = Order.statuses[:cart]
    end

    def checkout!(at)
        update!(status: :checked_out, ordered_at: at)
    end

end