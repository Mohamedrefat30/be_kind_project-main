import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:be_kind_project/core/theme/app_colors.dart';

class TranslationResultScreen extends StatefulWidget {
  final String imagePath;
  final String resultText;
  final String? audioUrl;

  const TranslationResultScreen({
    super.key,
    required this.imagePath,
    required this.resultText,
    this.audioUrl,
  });

  @override
  State<TranslationResultScreen> createState() =>
      _TranslationResultScreenState();
}

class _TranslationResultScreenState extends State<TranslationResultScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playAudio() async {
    if (widget.audioUrl == null || widget.audioUrl!.isEmpty) return;

    try {
      setState(() => _isPlaying = true);

      String cleanAudioUrl = widget.audioUrl!;
      if (cleanAudioUrl.startsWith('/')) {
        cleanAudioUrl = cleanAudioUrl.substring(1);
      }

      final String fullUrl =
          'https://newproject-production-396a.up.railway.app/$cleanAudioUrl';
      debugPrint("🎵 تشغيل النطق الصوتي من الرابط: $fullUrl");

      await _audioPlayer.play(UrlSource(fullUrl));

      _audioPlayer.onPlayerComplete.listen((_) {
        if (mounted) setState(() => _isPlaying = false);
      });
    } catch (e) {
      debugPrint("💥 خطأ تشغيل الصوت: $e");
      if (mounted) {
        setState(() => _isPlaying = false);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("تعذر تشغيل الصوت: $e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "النتيجة",
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: File(widget.imagePath).existsSync()
                        ? Image.file(File(widget.imagePath), fit: BoxFit.cover)
                        : const Icon(
                            Icons.broken_image,
                            size: 120,
                            color: Colors.grey,
                          ),
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  "AI Translation:",
                  style: GoogleFonts.inter(
                    color: Colors.grey[500],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.resultText,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: AppColors.rose,
                  ),
                ),
                const SizedBox(height: 30),
                if (widget.audioUrl != null && widget.audioUrl!.isNotEmpty)
                  Column(
                    children: [
                      Text(
                        "Listen to Pronunciation",
                        style: GoogleFonts.inter(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 12),
                      IconButton.filled(
                        onPressed: _isPlaying ? null : _playAudio,
                        icon: Icon(
                          _isPlaying ? Icons.stop : Icons.volume_up,
                          size: 36,
                          color: Colors.white,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.rose,
                          padding: const EdgeInsets.all(16),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
