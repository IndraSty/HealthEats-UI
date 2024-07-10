class ApiConfig {
  static String baseUrl = 'http://10.0.2.2:5000';

  // user endpoint
  static String register = '$baseUrl/users/register';
  static String login = '$baseUrl/users/login';
  static String user = '$baseUrl/users/current';
  static String updateUser = '$baseUrl/users/current/update';
  static String token = '$baseUrl/users/token';
  static String logout = '$baseUrl/users/logout';

  //food endpoint
  static String randomFood = '$baseUrl/foods/random';
  static String detailFood = '$baseUrl/foods/';
  static String allFood = '$baseUrl/foods/all';
  static String searchFood = '$baseUrl/foods';

  //prediction
  static String prediction = '$baseUrl/predictions';

  //favorite endpoint
  static String addFavorite = '$baseUrl/foods/favorite';
  static String rmFavorite = '$baseUrl/foods/favorite';
  static String allFavorite = '$baseUrl/foods/favorite/all';
}
