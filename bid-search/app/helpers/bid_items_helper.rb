module BidItemsHelper


  def price(realized_price)
    if realized_price.to_f == 0.0
      realized_price
    else
      "￥#{number_with_delimiter(realized_price.gsub(',','').to_f)}"
    end

  end
end
