import 'package:go_router/go_router.dart';
import 'pages/gallery_page.dart';
import 'pages/home_page.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: 'home',
    builder: (context, state) => HomePage(),
  ),
  GoRoute(
    path: '/gallery/:departmentId',
    name: 'gallery-view',
    builder: (context, state) => GalleryPage(
      deparmentId: int.parse(state.params['departmentId']!),
    ),
  ),
]);
