/*
 * @Author: Marlon.M
 * @Email: maiguangyang@163.com
 * @Date: 2024-08-02 15:03:54
 */

/// 策略接口
abstract class IPricingStrategy {
  double calculatePrice(double originalPrice);
}
