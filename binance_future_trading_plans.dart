void main() {
  const expectedProfitForYearInRupees = 1200000;
  const expectedProfitForMonthInRupees = expectedProfitForYearInRupees / 12;
  const expectedProfitForDayInRupees = expectedProfitForMonthInRupees / 30;
  const currentRateOfUsdt = 89;
  const leverageForEachTradeInUsdt = 20;
  const sizeForEachTradeInUsdt = 6;
  const expectedProfitForEachTradeInUsdt = 0.2;
  const sizeForEachTradeMultiplier = 5;

  print("Expected profit for a year : $expectedProfitForYearInRupees INR");
  print("Expected profit for a month : $expectedProfitForMonthInRupees INR");
  print("Expected profit for a day : $expectedProfitForDayInRupees INR");

  print("\nLeverage for each trade : ${leverageForEachTradeInUsdt}x");
  print(
      "Size of each trade : ${sizeForEachTradeInUsdt * sizeForEachTradeMultiplier} USDT");
  print(
      "Expected profit for each trade : ${expectedProfitForEachTradeInUsdt * sizeForEachTradeMultiplier} USDT");

  double capitalForEachTrade =
      (sizeForEachTradeInUsdt * sizeForEachTradeMultiplier) /
          leverageForEachTradeInUsdt;
  print("\nCapital for each trade : $capitalForEachTrade USDT");

  int requiredTradesForDay =
      ((expectedProfitForDayInRupees / currentRateOfUsdt) /
              (expectedProfitForEachTradeInUsdt * sizeForEachTradeMultiplier))
          .ceil();
  print("\nRequired trades for a day : $requiredTradesForDay");
  double requiredBudgetForDayInUsdt =
      requiredTradesForDay * capitalForEachTrade;
  print("\nRequired budget for a day : $requiredBudgetForDayInUsdt USDT");
  print(
      "Required budget for a day : ${requiredBudgetForDayInUsdt * currentRateOfUsdt} INR");

  print(
      "\n---------------------------------------------------------------------------------");

  const currentBudgetForDayInUsdt = 11.81605876;
  print("\nCurrent budget for the day : $currentBudgetForDayInUsdt USDT");
  print(
      "Available trades for the day using $currentBudgetForDayInUsdt USDT : ${(currentBudgetForDayInUsdt / capitalForEachTrade).ceil()} (Trade Size Multiplier : $sizeForEachTradeMultiplier)");
  if (sizeForEachTradeMultiplier > 1) {
    print(
        "\n---------------------------------------------------------------------------------");

    const newSizeForEachTradeMultiplier = 1;
    print("\nNew trade size multiplier value (for $currentBudgetForDayInUsdt USDT) : $newSizeForEachTradeMultiplier");
    print(
        "Available trades for the day (for $currentBudgetForDayInUsdt USDT) : ${(currentBudgetForDayInUsdt / ((sizeForEachTradeInUsdt * newSizeForEachTradeMultiplier) / leverageForEachTradeInUsdt)).ceil()} (Trade Size Multiplier : $newSizeForEachTradeMultiplier)");

    print("\nLeverage for each trade (for $currentBudgetForDayInUsdt USDT) : ${leverageForEachTradeInUsdt}x");
    print(
        "Size of each trade (for $currentBudgetForDayInUsdt USDT) : ${sizeForEachTradeInUsdt * newSizeForEachTradeMultiplier} USDT");
    print(
        "Expected profit for each trade (for $currentBudgetForDayInUsdt USDT) : ${expectedProfitForEachTradeInUsdt * newSizeForEachTradeMultiplier} USDT");

    capitalForEachTrade =
        (sizeForEachTradeInUsdt * newSizeForEachTradeMultiplier) /
            leverageForEachTradeInUsdt;
    print("\nCapital for each trade (for $currentBudgetForDayInUsdt USDT) : $capitalForEachTrade USDT");
  }
}
