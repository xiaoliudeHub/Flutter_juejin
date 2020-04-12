import './router_handler.dart';
import 'package:fluro/fluro.dart';

class Routes {
  static String root = '/';
  static String articleDetail = '/detail';
  static String swipPage = '/swip';

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
      handlerFunc: (context, parameters) {
        print("ROUTE WAS NOT FOUND !!!");
      },
    );
    router.define(articleDetail, handler: articleDetailHandler);
    router.define(swipPage, handler: swipPageHandler);
  }
}