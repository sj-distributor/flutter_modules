/*
 * @Author: Marlon.M
 * @Email: maiguangyang@163.com
 * @Date: 2024-08-02 15:10:39
 */
import 'discount_strategy.dart';
import 'full_reduction_strategy.dart';
import 'pricing.dart';

void main() {
  var pricing = Pricing();
  pricing.addStrategy(FullReductionStrategy(100, 10)); // 满100减10
  pricing.addStrategy(DiscountStrategy(0.1)); // 10% 折扣

  pricing.addStrategy(DiscountStrategy(0.1)); // 10% 折扣
  pricing.addStrategy(FullReductionStrategy(100, 10)); // 满100减10

  pricing.addStrategy(DiscountStrategy(0.1)); // 10% 折扣
  pricing.addStrategy(FullReductionStrategy(100, 10)); // 满100减10

  double finalPrice = pricing.calculateFinalPrice(120);
  print('最终价格: $finalPrice'); // 最优惠的价格
}
