import 'package:game_app/core/auth/functions/auth_state.dart';
import 'package:game_app/core/data/functions/data_state.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (context) => AuthState(),
    lazy: false,
  ),
  ChangeNotifierProvider(
    create: (context) => DataState(),
    lazy: false,
  ),
];
