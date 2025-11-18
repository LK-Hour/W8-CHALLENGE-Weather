import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seasons Around The World',
      debugShowCheckedModeBanner: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3A7DFF)),
        useMaterial3: true,
      ),
      home: const SeasonHomePage(),
    );
  }
}

// Enum representing the four seasons
enum Season {
  winter,
  spring,
  summer,
  autumn;

  // Get display name for the season
  String get displayName {
    switch (this) {
      case Season.winter:
        return 'Winter';
      case Season.spring:
        return 'Spring';
      case Season.summer:
        return 'Summer';
      case Season.autumn:
        return 'Autumn';
    }
  }

  // Get image path for the season (computed)
  String get imagePath {
    switch (this) {
      case Season.winter:
        return 'assets/winter.png';
      case Season.spring:
        return 'assets/spring.png';
      case Season.summer:
        return 'assets/summer.png';
      case Season.autumn:
        return 'assets/fall.png';
    }
  }

  // Get next season in the cycle
  Season get next {
    final values = Season.values;
    final nextIndex = (index + 1) % values.length;
    return values[nextIndex];
  }
}

// Constants
const String seasonsTitle = 'SEASONS';

class SeasonHomePage extends StatelessWidget {
  const SeasonHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text('Seasons Explorer'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(26),
            border: Border.all(color: Colors.grey.shade400, width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                seasonsTitle, // Constants
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 280,
                child: Row(
                  children: const [
                    Expanded(
                      child: SeasonCard(
                        season: Season.winter, // enum
                        imagePath: 'assets/winter.png', // String
                        city: 'FRANCE', // String: city (Parameter)
                      ),
                    ),
                    SizedBox(width: 18),
                    Expanded(
                      child: SeasonCard(
                        season: Season.summer, // enum
                        imagePath: 'assets/summer.png', // String
                        city: 'CAMBODIA', // String: city (Parameter)
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SeasonCard extends StatefulWidget {
  const SeasonCard({
    super.key,
    required this.season, // enum: Season
    required this.imagePath, // String: imagePath
    required this.city, // String: city
  });

  final Season season; // Argument: enum
  final String imagePath; // Argument: String
  final String city; // Argument: String

  @override
  State<SeasonCard> createState() => _SeasonCardState();
}

class _SeasonCardState extends State<SeasonCard> {
  late int currentSeason; // State: int

  @override
  void initState() {
    super.initState();
    // Initialize current season based on passed enum
    currentSeason = widget.season.index;
  }

  void _goToNextSeason() {
    setState(() {
      // Cycle through 4 seasons (0, 1, 2, 3)
      currentSeason = (currentSeason + 1) % Season.values.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Computed: Get current season from the enum values
    final Season displayedSeason = Season.values[currentSeason];
    final String seasonImage = displayedSeason.imagePath; // Computed
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: _goToNextSeason,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey.shade400, width: 1.6),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  color: Colors.grey.shade200,
                  child: Image.asset(
                    seasonImage, // Computed from enum
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.city, // Parameter
              textAlign: TextAlign.center,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
