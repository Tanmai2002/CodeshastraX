import 'package:get/get.dart';

class WeatherProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://api.openweathermap.org/data/2.5';
  }

  Future<Response> getWeather(String city) => get('/weather', query: {
        'q': city,
        'appid'
            : 'b1b15e88fa797225412429c1c50c122a1',
      });

  Future<Response> getWeatherByLocation(double lat, double lon) =>
      get('/weather', query: {
        'lat': lat,
        'lon': lon,
        'appid'
            : 'b1b15e88fa797225412429c1c50c122a1',
      });

  Future<Response> getForecast(String city) => get('/forecast', query: {
        'q': city,
        'appid'
            : 'b1b15e88fa797225412429c1c50c122a1',
      });

  Future<Response> getForecastByLocation(double lat, double lon) =>
      get('/forecast', query: {
        'lat': lat,
        'lon': lon,
        'appid'
            : 'b1b15e88fa797225412429c1c50c122a1',
      });
  
  
}
