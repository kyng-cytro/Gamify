import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:game_app/core/constants/app_constants.dart';
import 'package:game_app/core/data/model/games.dart';
import 'package:http/http.dart' as http;

class DataState extends ChangeNotifier {
  late List<Games> _sliderGames;
  late List<Games> _games;
  late List<Games> _bannerGames;
  late List<Games> _searchResults;
  late String _query;

  List<Games> get games => _games;
  List<Games> get sliders => _sliderGames;
  List<Games> get banners => _bannerGames;
  List<Games> get search => _searchResults;

  set query(String query) {
    _query = query;
    searchGames();
  }

  DataState() {
    _init();
  }

  _init() {
    _games = [];
    _sliderGames = [];
    _bannerGames = [];
    _searchResults = [];
    _loadgames();
    _loadSliders();
    _loadBanners();
  }

  _loadgames() async {
    var res = await http.get(Uri.parse(
        'https://api.rawg.io/api/games?page_size=100&key=${AppConstants.api_key}'));
    if (res.statusCode == 200) {
      var jsondata = jsonDecode(res.body);
      var data = jsondata['results'];
      _games = List<Games>.from(data.map((e) => Games.fromJson(e)));
      games.shuffle();
      notifyListeners();
    } else {
      print("Error getting games");
    }
  }

  _loadSliders() async {
    var res = await http.get(
      Uri.parse(
          'https://api.rawg.io/api/games?page_size=3&ordering=-rating&key=${AppConstants.api_key}'),
    );
    if (res.statusCode == 200) {
      var jsondata = jsonDecode(res.body);
      var data = jsondata['results'];
      _sliderGames = List<Games>.from(data.map((e) => Games.fromJson(e)));
      notifyListeners();
    } else {
      print("Error getting slider games");
    }
  }

  _loadBanners() async {
    var res = await http.get(
      Uri.parse(
          'https://api.rawg.io/api/games?page_size=10&ordering=updated&key=${AppConstants.api_key}'),
    );
    if (res.statusCode == 200) {
      var jsondata = jsonDecode(res.body);
      var data = jsondata['results'];
      _bannerGames = List<Games>.from(data.map((e) => Games.fromJson(e)));
      notifyListeners();
    } else {
      print("Error getting banner games");
    }
  }

  searchGames() async {
    _searchResults = [];
    notifyListeners();
    var res = await http.get(Uri.parse(
        'https://api.rawg.io/api/games?search=$_query&key=${AppConstants.api_key}'));
    if (res.statusCode == 200) {
      var jsondata = jsonDecode(res.body);
      var data = jsondata['results'];
      _searchResults = List<Games>.from(data.map((e) => Games.fromJson(e)));
      notifyListeners();
    } else {
      print("An Error Occured");
    }
  }
}
