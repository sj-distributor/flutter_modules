/*
 * @Author: Marlon.M
 * @Email: maiguangyang@163.com
 * @Date: 2024-08-02 15:03:54
 */

import 'pricing_abstract.dart';

/// 实现折扣策略
class DiscountStrategy implements IPricingStrategy {
  final double discount;

  DiscountStrategy(this.discount);

  @override
  double calculatePrice(double originalPrice) {
    return originalPrice * (1 - discount);
  }
}
