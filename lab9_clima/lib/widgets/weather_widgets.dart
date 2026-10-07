import 'package:flutter/material.dart';

class WeatherDetailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const WeatherDetailItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 22, color: Colors.blueAccent),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                ),
                Text(
                  value,
                  style: TextStyle(color: Colors.grey[800], fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WeatherIconWidget extends StatelessWidget {
  final String iconCode;
  final int weatherId;
  final int dt;
  final int sunrise;
  final int sunset;
  final double size;

  const WeatherIconWidget({
    super.key,
    required this.iconCode,
    required this.weatherId,
    required this.dt,
    required this.sunrise,
    required this.sunset,
    this.size = 64,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDay = dt >= sunrise && dt <= sunset;
    final iconPrefix = iconCode.length >= 2 ? iconCode.substring(0, 2) : '01';

    IconData icon;
    Color iconColor = Colors.orangeAccent;

    switch (iconPrefix) {
      case '01': 
        icon = isDay ? Icons.wb_sunny : Icons.nightlight_round;
        iconColor = isDay ? Colors.amber : Colors.indigoAccent;
        break;
      case '02': 
      case '03': 
      case '04': 
        icon = isDay ? Icons.wb_cloudy : Icons.cloud;
        iconColor = Colors.blueGrey;
        break;
      case '09': // Mưa rào
      case '10': // Mưa
        icon = Icons.beach_access;
        iconColor = Colors.blue;
        break;
      case '11': // Dông bão
        icon = Icons.flash_on;
        iconColor = Colors.deepOrange;
        break;
      case '13': // Tuyết
        icon = Icons.ac_unit;
        iconColor = Colors.cyan;
        break;
      case '50': // Sương mù
        icon = Icons.blur_on;
        iconColor = Colors.grey;
        break;
      default:
        icon = Icons.wb_sunny;
    }

    return Icon(
      icon,
      size: size,
      color: iconColor,
    );
  }
}

class WeatherInfoCard extends StatelessWidget {
  final Widget child;

  const WeatherInfoCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFEDF5FF).withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Đang tải dữ liệu thời tiết...', style: TextStyle(color: Colors.grey)),
        SizedBox(height: 12),
        CircularProgressIndicator(),
      ],
    );
  }
}

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.red[100],
        border: Border.all(color: Colors.red.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        'Lỗi: $message',
        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
      ),
    );
  }
}