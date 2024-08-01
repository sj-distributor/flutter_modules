/*
 * @Author: Marlon.M
 * @Email: maiguangyang@163.com
 * @Date: 2024-08-01 09:20:21
 */

export 'flutter_route.dart';
export 'route_abstract.dart';
export 'route_enum.dart';
export 'route_strategy.dart';

class Route {
  const Route({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;
}
