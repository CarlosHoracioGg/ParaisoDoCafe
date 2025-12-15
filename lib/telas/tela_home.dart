import 'package:flutter/material.dart';
//import '../services/weather_service.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  Map<String, dynamic>? weatherData;
  String recommendation = "";
  bool loading = true;

  @override
  void initState() {
    super.initState();
    //loadWeather();
  }

  /* Future<void> loadWeather() async {
    try {
      WeatherService service = WeatherService();
      weatherData = await service.getWeather("São Paulo");

      generateRecommendation();

      setState(() {
        loading = false;
      });
    } catch (e) {
      setState(() => loading = false);
    }
  }

  void generateRecommendation() {
    if (weatherData == null) return;

    double temp = weatherData!["main"]["temp"];
    String condition = weatherData!["weather"][0]["main"];

    if (temp <= 18) {
      recommendation = "☕ Está frio! Recomendamos um cappuccino bem quente.";
    } else if (temp >= 30) {
      recommendation = "🥤 Calorão! Que tal um café gelado (iced coffee)?";
    } else if (condition.contains("Rain")) {
      recommendation = "🌧 Chuvoso! Um mocha quente combina perfeitamente.";
    } else {
      recommendation = "😄 Clima ameno! Experimente nosso café especial do dia.";
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFF414A37),
        title: const Text(
          "PARAÍSO DO CAFÉ",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "PREVISÃO DO TEMPO",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B1F0E),
              ),
            ),
            const SizedBox(height: 10),
            _buildWeatherCard(),
            const SizedBox(height: 20),

            // ----------- RECOMENDAÇÃO -----------
            Text(
              recommendation,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.brown,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "MUNDO CAFÉ - NOTÍCIAS",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B1F0E),
              ),
            ),

            const SizedBox(height: 10),

            _buildNewsItem(
              "Café inicia novembro em alta...",
              "Mercado responde positivamente...",
              "https://i.imgur.com/VR9Y8Zx.jpeg",
            ),
          ],
        ),
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: Container(
        color: const Color(0xFF4B1F0E),
        child: ListView(
          padding: const EdgeInsets.only(top: 40),
          children: const [
            ListTile(
              title: Text("SOBRE NÓS",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            ListTile(
              title: Text("CATÁLOGO",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            ListTile(
              title: Text("NOTÍCIAS",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherCard() {
    if (weatherData == null) {
      return const Text("Erro ao carregar clima.");
    }

    double temp = weatherData!["main"]["temp"];
    String description = weatherData!["weather"][0]["description"];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.cloud, size: 55, color: Colors.blueGrey),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${temp.toStringAsFixed(1)}°C",
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                description,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNewsItem(String title, String subtitle, String img) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold)),
              Text(subtitle, style: TextStyle(color: Colors.grey[700])),
            ],
          ),
        ),
        const SizedBox(width: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(img, width: 90, height: 70, fit: BoxFit.cover),
        ),
      ],
    );
  }
}