def stock_picker(prices)
	buy_date = 0;
	sell_date = 0;
	profit = 0;

  prices.each_with_index do |buy_price, buy_day|
    (buy_day+1..prices.length).each_with_index do |sell_price, sell_day|

      if sell_price - buy_price > profit
        profit = sell_price - buy_price
        buy_date = buy
        sell_date = buy_day + 1 + sell_day
      end
    end
  end

  [buy_date, sell_date]
end

if $PROGRAM_NAME == __FILE__
	stock_picker([17,3,6,9,15,8,6,1,10])
end
