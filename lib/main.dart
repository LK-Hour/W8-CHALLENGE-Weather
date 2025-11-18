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

class Season {
  const Season({
    required this.name,
    required this.imageAsset,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.description,
    required this.months,
  });

  final String name;
  final String imageAsset;
  final Color backgroundColor;
  final Color foregroundColor;
  final String description;
  final String months;
}

// Pre-configured season data for each country card.
const List<Season> franceSeasons = [
  Season(
    name: 'Winter',
    imageAsset: 'assets/winter.png',
    backgroundColor: Color(0xFF12355B),
    foregroundColor: Colors.white,
    description: 'Snowy Alps, cozy cafés, and festive markets.',
    months: 'December – February',
  ),
  Season(
    name: 'Spring',
    imageAsset: 'assets/spring.png',
    backgroundColor: Color(0xFF51A37A),
    foregroundColor: Colors.white,
    description: 'Cherry blossoms along the Seine and mild breezes.',
    months: 'March – May',
  ),
  Season(
    name: 'Summer',
    imageAsset: 'assets/summer.png',
    backgroundColor: Color(0xFFFFB347),
    foregroundColor: Colors.black,
    description: 'Beach days on the Riviera and long sunny evenings.',
    months: 'June – August',
  ),
  Season(
    name: 'Autumn',
    imageAsset: 'assets/fall.png',
    backgroundColor: Color(0xFF8D5524),
    foregroundColor: Colors.white,
    description: 'Vineyard harvests and colorful parks across Paris.',
    months: 'September – November',
  ),
];

const List<Season> cambodiaSeasons = [
  Season(
    name: 'Cool & Dry',
    imageAsset: 'assets/winter.png',
    backgroundColor: Color(0xFF0F4C75),
    foregroundColor: Colors.white,
    description: 'Pleasant mornings in Phnom Penh with cool breezes.',
    months: 'December – February',
  ),
  Season(
    name: 'Hot',
    imageAsset: 'assets/spring.png',
    backgroundColor: Color(0xFFFFA41B),
    foregroundColor: Colors.black,
    description: 'Siem Reap basks in bright sunshine and soaring temps.',
    months: 'March – May',
  ),
  Season(
    name: 'Rainy',
    imageAsset: 'assets/summer.png',
    backgroundColor: Color(0xFF2F6690),
    foregroundColor: Colors.white,
    description: 'Monsoon showers refresh the rice fields and temples.',
    months: 'June – September',
  ),
  Season(
    name: 'Transition',
    imageAsset: 'assets/fall.png',
    backgroundColor: Color(0xFF774936),
    foregroundColor: Colors.white,
    description: 'Rivers recede and festivals prepare for the cool season.',
    months: 'October – November',
  ),
];

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
                'SEASONS',
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
                        country: 'France',
                        seasons: franceSeasons,
                        initialIndex: 0,
                      ),
                    ),
                    SizedBox(width: 18),
                    Expanded(
                      child: SeasonCard(
                        country: 'Cambodia',
                        seasons: cambodiaSeasons,
                        initialIndex: 2,
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
    required this.country,
    required this.seasons,
    this.initialIndex = 0,
  });

  final String country;
  final List<Season> seasons;
  final int initialIndex;

  @override
  State<SeasonCard> createState() => _SeasonCardState();
}

class _SeasonCardState extends State<SeasonCard> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    final seasonCount = widget.seasons.length;
    _currentIndex = seasonCount == 0 ? 0 : widget.initialIndex % seasonCount;
  }

  void _goToNextSeason() {
    if (widget.seasons.isEmpty) {
      return;
    }
    setState(() {
      _currentIndex = (_currentIndex + 1) % widget.seasons.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final season = widget.seasons[_currentIndex];
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
                  color: season.backgroundColor.withOpacity(0.18),
                  child: Image.asset(
                    season.imageAsset,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.country.toUpperCase(),
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
