import 'package:marvel_api/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:marvel_api/app/app_widget.dart';
import 'package:marvel_api/app/modules/comics/comics_module.dart';
import 'package:marvel_api/app/modules/home/favorites/favorites_module.dart';
import 'package:marvel_api/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/comics', module: ComicsModule()),
        Router('/favorites', module: FavoritesModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
