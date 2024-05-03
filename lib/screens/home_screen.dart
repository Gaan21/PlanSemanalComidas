import 'package:app_comidas_semanales/models/base/base_model.dart';
import 'package:app_comidas_semanales/providers/providers.dart';
import 'package:app_comidas_semanales/screens/base/base_screen.dart';
import 'package:app_comidas_semanales/services/services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends BaseScreen<HomeService, ListaDiasProvider, BaseModel> {
  const HomeScreen({super.key}) : super(visibleBottomNavigationBar: true);

  @override
  Widget getBody(
      {required BuildContext context,
      required ListaDiasProvider formProvider,
      required HomeService service}) {
    // TODO: implement getBody
    return Container();
  }

  @override
  String getTitle(ListaDiasProvider formProvider) {
    return "HomeScreen";
  }
}
