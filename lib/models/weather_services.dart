/*import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = "SUA_API_KEY_AQUI";

  Future<Map<String, dynamic>> getWeather(String city) async {
    final url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric&lang=pt_br"
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Erro ao carregar clima");
    }
  }
}*/