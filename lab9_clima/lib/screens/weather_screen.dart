import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/weather_data.dart';
import '../services/weather_service.dart';
import '../widgets/weather_widgets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _searchController = TextEditingController();
  final WeatherService _weatherService = WeatherService();
  String _location = 'Da Nang';
  WeatherData? _weatherData;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchWeather(_location);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchWeather(String city) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final weatherData = await _weatherService.getWeather(city);
      setState(() {
        _weatherData = weatherData;
        _isLoading = false;
      });
    } catch (err) {
      setState(() {
        _error = err.toString().replaceAll('Exception: ', '');
        _isLoading = false;
      });
    }
  }

  void _handleSearchSubmit() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      setState(() {
        _location = query;
      });
      _fetchWeather(query);
    } else {
      setState(() {
        _error = 'Vui lòng nhập tên thành phố.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFDCEEFB), Color(0xFFE9DCFB)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildMainCard(),
                  const SizedBox(height: 20),
                  const Text(
                    'Dữ liệu thời tiết cung cấp bởi OpenWeatherMap',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainCard() {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 550),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Weather Clima App',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1F36),
            ),
          ),
          const SizedBox(height: 20),

          _buildSearchForm(),

          const SizedBox(height: 20),

          if (_isLoading) const LoadingIndicator(),

          if (_error != null && !_isLoading) ErrorMessage(message: _error!),

          if (_weatherData != null && !_isLoading && _error == null)
            _buildWeatherDisplay(),
        ],
      ),
    );
  }

  Widget _buildSearchForm() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Nhập tên thành phố (London, Hanoi...)',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ),
            onSubmitted: (_) => _handleSearchSubmit(),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: _handleSearchSubmit,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text('Tìm kiếm', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _buildWeatherDisplay() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, color: Colors.blueAccent),
            const SizedBox(width: 4),
            Text(
              '${_weatherData!.name}, ${_weatherData!.country}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1F36),
              ),
            ),
          ],
        ),

        const SizedBox(height: 4),

        Text(
          'Cập nhật lúc: ${DateFormat('hh:mm a').format(DateTime.now())}',
          style: const TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 20),

        WeatherInfoCard(
          child: Column(
            children: [
              WeatherIconWidget(
                iconCode: _weatherData!.icon,
                weatherId: _weatherData!.weatherId,
                dt: _weatherData!.dt,
                sunrise: _weatherData!.sunrise,
                sunset: _weatherData!.sunset,
              ),
              const SizedBox(height: 8),
              Text(
                _weatherData!.description.toUpperCase(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                '${_weatherData!.temp.round()}°C',
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1F36),
                ),
              ),
              Text(
                'Cảm giác như: ${_weatherData!.feelsLike.round()}°C',
                style: const TextStyle(color: Colors.grey, fontSize: 15),
              ),

              const SizedBox(height: 20),

             GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: 2.6,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  WeatherDetailItem(
                    icon: Icons.water_drop,
                    label: 'Độ ẩm',
                    value: '${_weatherData!.humidity}%',
                  ),
                  WeatherDetailItem(
                    icon: Icons.air,
                    label: 'Tốc độ gió',
                    value: '${_weatherData!.windSpeed} m/s',
                  ),
                  WeatherDetailItem(
                    icon: Icons.thermostat,
                    label: 'Nhiệt độ thấp nhất',
                    value: '${_weatherData!.tempMin.round()}°C',
                  ),
                  WeatherDetailItem(
                    icon: Icons.local_fire_department,
                    label: 'Nhiệt độ cao nhất',
                    value: '${_weatherData!.tempMax.round()}°C',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}