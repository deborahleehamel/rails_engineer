module ItemsHelper
  def format_price(price)
    (price/100.0).to_s
  end
end
