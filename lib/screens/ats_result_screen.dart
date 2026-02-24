import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/resume_provider.dart';

class AtsResultScreen extends StatelessWidget {
  const AtsResultScreen({super.key});

  Color getScoreColor(int score) {
    if (score >= 75) return Colors.green;
    if (score >= 50) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final result = Provider.of<ResumeProvider>(context).result!;
    final scoreColor = getScoreColor(result.score);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff1e3c72), Color(0xff2a5298)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                /// 🔵 Title
                Center(
                  child: Text(
                    "ATS Result",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                SizedBox(height: 40),

                /// 🔥 Animated Circular Score
                Center(
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: result.score.toDouble()),
                    duration: Duration(seconds: 2),
                    builder: (context, value, child) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 170,
                            height: 170,
                            child: CircularProgressIndicator(
                              value: value / 100,
                              strokeWidth: 12,
                              backgroundColor: Colors.white.withOpacity(0.2),
                              valueColor: AlwaysStoppedAnimation(scoreColor),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "${value.toInt()}%",
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Match Score",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),

                SizedBox(height: 40),

                /// 🟢 Matched Keywords Card
                buildSectionCard(
                  title: "Matched Keywords",
                  icon: Icons.check_circle,
                  iconColor: Colors.green,
                  keywords: result.matchedKeywords,
                  chipColor: Colors.green.shade100,
                ),

                SizedBox(height: 20),

                /// 🔴 Missing Keywords Card
                buildSectionCard(
                  title: "Missing Keywords",
                  icon: Icons.cancel,
                  iconColor: Colors.red,
                  keywords: result.missingKeywords,
                  chipColor: Colors.red.shade100,
                ),

                SizedBox(height: 20),

                /// 📝 Summary Card
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Profile Summary",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        result.summary,
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSectionCard({
    required String title,
    required IconData icon,
    required Color iconColor,
    required List<String> keywords,
    required Color chipColor,
  }) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor),
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: keywords
                .map(
                  (e) => Chip(
                    label: Text(e),
                    backgroundColor: chipColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
