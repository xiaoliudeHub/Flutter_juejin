
import 'package:fluro/fluro.dart';
import 'package:juejin_app/pages/login.dart';
import 'package:juejin_app/pages/swip_page.dart';
import '../pages/article_detail.dart';

Handler articleDetailHandler = Handler(
   handlerFunc: (context, parameters) {
     String articleUrl = parameters['id']?.first;
     String title = parameters['title']?.first;
     return ArticleDetailPage(articleUrl, title);
   },
);

Handler swipPageHandler = Handler(
    handlerFunc: (context, parameters) {
     String pics = parameters['pics']?.first;
     String index = parameters['currentIndex']?.first;
     return SwipPage(pics: pics, currentIndex: index);
   },
);

Handler loginPageHandler = Handler(
   handlerFunc: (context, parameters) {
     
     return Login();
   },
);