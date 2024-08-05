/*
 * @Author: Marlon.M
 * @Email: maiguangyang@163.com
 * @Date: 2024-08-02 15:06:16
 */
import 'pricing_abstract.dart';

/// 实现满减策略
class FullReductionStrategy implements IPricingStrategy {
  /// 满减门槛
  final double threshold;

  /// 减免金额
  final double reduction;

  FullReductionStrategy(this.threshold, this.reduction);

  @override
  double calculatePrice(double originalPrice) {
    if (originalPrice >= threshold) {
      return originalPrice - reduction;
    }
    return originalPrice;
  }
}
