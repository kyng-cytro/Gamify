import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:game_app/core/auth/model/user_model.dart';
import 'package:game_app/core/constants/app_constants.dart';

class AuthState extends ChangeNotifier {
  Client client = Client();
  late Account account;
  late bool _isLoggedIn;
  late User _user;
  late String _error;

  bool get isLoggedIn => _isLoggedIn;
  User get user => _user;
  String get error => _error;

  AuthState() {
    _init();
  }

  _init() {
    _isLoggedIn = false;
    client
        .setEndpoint(AppConstants.endpoint)
        .setProject(AppConstants.projectId);
    account = Account(client);
    checkedloggedin();
  }

  checkedloggedin() async {
    try {
      _user = await _getAccount();
      _isLoggedIn = true;
      notifyListeners();
    } catch (e) {}
  }

  Future<User> _getAccount() async {
    try {
      Response res = await account.get();
      if (res.statusCode == 200) {
        return User.fromJson(res.data);
      } else {
        return null as User;
      }
    } catch (e) {
      throw (e);
    }
  }

  login(String email, String password) async {
    try {
      await account.createSession(email: email, password: password);
    } catch (e) {
      return e;
    }
    try {
      _user = await _getAccount();
    } catch (e) {
      return e;
    }
    _isLoggedIn = true;
    notifyListeners();
    return true;
  }

  createaccount(String name, String email, String password) async {
    try {
      await account.create(name: name, email: email, password: password);
      await account.createSession(email: email, password: password);
    } catch (e) {
      return e;
    }
    try {
      _user = await _getAccount();
    } catch (e) {
      return (e);
    }
    notifyListeners();
    return true;
  }

  updateaccount(String name) async {
    try {
      await account.updateName(name: name);
      _user = await _getAccount();
    } catch (e) {
      return e;
    }
    notifyListeners();
    return true;
  }

  logout() async {
    try {
      await account.deleteSession(sessionId: "current");
    } catch (e) {
      return e;
    }
    try {
      _user = await _getAccount();
    } catch (e) {
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }
  //TODO fix  reset
  resetpass(String email) async {
    try {
      await account.createRecovery(
        email: email,
        url: "url",
      );
    } catch (e) {
      return e;
    }
  }
}
