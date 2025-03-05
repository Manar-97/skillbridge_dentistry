import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillbridge_dentistry/ui/utils/appcolors.dart';

class PointsScreen extends StatefulWidget {
  const PointsScreen({super.key});
  static const String routeName = 'points';
  @override
  State<PointsScreen> createState() => _PointsScreenState();
}

class _PointsScreenState extends State<PointsScreen> {
  final List<double> weeklySpends = [4.3, 3.1, 2.8, 3.5, 1.9, 2.2, 1.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                'If you collect 10 points, you will\nget a discount on consulting\nwith the advisor.',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont('Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF2F504D)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.commentBgrColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          children: [
                            Text(
                              'Total points',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black54),
                            ),
                            Text(
                              '4.3',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Chip(
                            label: const Text('Month'),
                            backgroundColor: Colors.teal.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    AspectRatio(
                      aspectRatio: 2,
                      child: BarChart(
                        BarChartData(
                          barGroups: _buildBarGroups(),
                          titlesData: FlTitlesData(
                            leftTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            rightTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            topTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  const days = [
                                    'S',
                                    'M',
                                    'T',
                                    'W',
                                    'T',
                                    'F',
                                    'S'
                                  ];
                                  return Text(
                                    days[value.toInt()],
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 12),
                                  );
                                },
                              ),
                            ),
                          ),
                          gridData: const FlGridData(show: false),
                          borderData: FlBorderData(show: false),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      children: [
                        Icon(Icons.circle, size: 10, color: Colors.teal),
                        SizedBox(width: 4),
                        Text('Spends statistic',
                            style: TextStyle(color: Colors.black54)),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    return List.generate(7, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: weeklySpends[index],
            color: Colors.teal,
            width: 16,
            borderRadius: BorderRadius.circular(6),
          )
        ],
      );
    });
  }
}
