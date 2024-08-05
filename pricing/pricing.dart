/*
 * @Author: Marlon.M
 * @Email: maiguangyang@163.com
 * @Date: 2024-08-02 15:08:49
 */
import 'dart:math';

import 'pricing_abstract.dart';

class Pricing {
  final List<IPricingStrategy> _strategies = [];

  void addStrategy(IPricingStrategy strategy) {
    _strategies.add(strategy);
  }

  double calculateFinalPrice(double originalPrice) {
    double minPrice = _calculateOptimalPrice(originalPrice, _strategies);
    return double.parse(minPrice.toStringAsFixed(2)); // 保留两位小数
  }

  double _calculateOptimalPrice(
      double originalPrice, List<IPricingStrategy> strategies) {
    List<List<IPricingStrategy>> permutations =
        _generatePermutations(strategies);
    double minPrice = double.infinity;

    for (var permutation in permutations) {
      double price = originalPrice;
      for (var strategy in permutation) {
        price = strategy.calculatePrice(price);
      }
      minPrice = min(minPrice, price);
    }

    return minPrice;
  }

  List<List<IPricingStrategy>> _generatePermutations(
      List<IPricingStrategy> list) {
    if (list.length == 1) {
      return [list];
    }

    List<List<IPricingStrategy>> permutations = [];
    for (int i = 0; i < list.length; i++) {
      List<IPricingStrategy> remaining = List.from(list)..removeAt(i);
      List<List<IPricingStrategy>> remainingPermutations =
          _generatePermutations(remaining);
      for (var permutation in remainingPermutations) {
        permutations.add([list[i], ...permutation]);
      }
    }

    return permutations;
  }
}
