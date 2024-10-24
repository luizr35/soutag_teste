class PriceService
  attr_reader :product, :user

  def initialize(product:, user:)
    @product = product
    @user = user
  end

  def call
    total_price_with_discounts
  end

  private

  def base_price
    product[:base_price]
  end

  def tax_amount
    base_price * (product[:tax_percentage] / 100.0)
  end

  def total_price
    base_price + tax_amount
  end

  def total_price_with_discounts
    apply_discounts(total_price)
  end

  def apply_discounts(price)
    price = apply_category_discount(price)
    apply_birthday_discount(price)
  end

  def apply_category_discount(price)
    return price unless eligible_for_category_discount?

    price * (1 - category_discount_percentage)
  end

  def eligible_for_category_discount?
    %w[food beverages].include?(product[:category])
  end

  def category_discount_percentage
    0.05
  end

  def apply_birthday_discount(price)
    return price unless birthday_month?

    price * (1 - birthday_discount_percentage)
  end

  def birthday_month?
    user[:birthday_month] == Time.now.month
  end

  def birthday_discount_percentage
    0.10
  end
end