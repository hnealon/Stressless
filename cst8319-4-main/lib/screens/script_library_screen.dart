import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/script_library_data.dart';
import '../models/script_library_example.dart';
import '../theme.dart';

class ScriptLibraryScreen extends StatefulWidget {
  const ScriptLibraryScreen({super.key});

  @override
  State<ScriptLibraryScreen> createState() => _ScriptLibraryScreenState();
}

class _ScriptLibraryScreenState extends State<ScriptLibraryScreen> {
  ScriptLibraryExample? _selectedExample;
  String? _selectedEmotion;
  final List<String> _libraryBecause = [];
  final List<String> _libraryEmotional = [];
  final List<String> _libraryPractical = [];

  String _generatedScript = '';

  void _clearSelection() {
    setState(() {
      _selectedExample = null;
      _selectedEmotion = null;
      _libraryBecause.clear();
      _libraryEmotional.clear();
      _libraryPractical.clear();
      _updateScript();
    });
  }

  void _selectExample(ScriptLibraryExample example) {
    setState(() {
      _selectedExample = example;
      _selectedEmotion = example.emotion;
      _libraryBecause.clear();
      _libraryEmotional.clear();
      _libraryPractical.clear();
      _updateScript();
    });
  }

  void _updateScript() {
    setState(() {
      _generatedScript = _buildLibraryScript();
    });
  }

  String _buildLibraryScript() {
    final example = _selectedExample;
    if (example == null ||
        _libraryBecause.length < example.becauseCount ||
        _libraryEmotional.length < example.emotionalCount) {
      return '';
    }

    final becauses = List<String>.from(_libraryBecause);
    final last = becauses.removeLast();
    final becauseClause = becauses.isEmpty
        ? last
        : '${becauses.join(', ')}, and $last';

    final emotional = _libraryEmotional.join(' ');
    final practical = _libraryPractical.join(' ');

    return '${example.validationOpener} $becauseClause. $emotional $practical'
        .trim();
  }

  bool get _hasCompleteScript {
    final example = _selectedExample;
    if (example == null) return false;
    return _libraryBecause.length == example.becauseCount &&
        _libraryEmotional.length >= example.emotionalCount &&
        _generatedScript.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final emotions = scriptLibraryEmotions;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SCRIPT LIBRARY',
                      style: GoogleFonts.nunito(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                        letterSpacing: 1.4,
                      ),
                    ).animate().fadeIn(duration: 300.ms),
                    const SizedBox(height: 4),
                    Text(
                      'Validation and support examples.',
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                        height: 1.15,
                      ),
                    ).animate().fadeIn(delay: 80.ms, duration: 400.ms),
                    const SizedBox(height: 10),
                    Text(
                      'Choose an emotion and scenario from $kScriptLibrarySourceDocument. Your script assembles at the bottom as you go.',
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                        height: 1.6,
                      ),
                    ).animate().fadeIn(delay: 160.ms, duration: 400.ms),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Text(
                    'Emotion',
                    style: GoogleFonts.nunito(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: emotions.map((emotion) {
                      final isSelected = _selectedEmotion == emotion;
                      return ChoiceChip(
                        label: Text(emotion),
                        selected: isSelected,
                        onSelected: (_) {
                          setState(() {
                            if (_selectedEmotion == emotion) {
                              _clearSelection();
                            } else {
                              _selectedEmotion = emotion;
                              _selectedExample = null;
                              _libraryBecause.clear();
                              _libraryEmotional.clear();
                              _libraryPractical.clear();
                              _updateScript();
                            }
                          });
                        },
                        backgroundColor: AppColors.surface,
                        selectedColor: AppColors.primary,
                        labelStyle: GoogleFonts.nunito(
                          color: isSelected
                              ? Colors.white
                              : AppColors.textPrimary,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w600,
                          fontSize: 13,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.cardBorder,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  if (_selectedEmotion != null) ...[
                    const SizedBox(height: 20),
                    Text(
                      'Scenario',
                      style: GoogleFonts.nunito(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...examplesForEmotion(_selectedEmotion!).map((example) {
                      final isSelected = _selectedExample?.id == example.id;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Material(
                          color: isSelected
                              ? AppColors.validationCard
                              : AppColors.surface,
                          borderRadius: BorderRadius.circular(12),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () => _selectExample(example),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.primary
                                      : AppColors.cardBorder,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    example.title,
                                    style: GoogleFonts.nunito(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    example.validationOpener,
                                    style: GoogleFonts.nunito(
                                      fontSize: 13,
                                      color: AppColors.textSecondary,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                  if (_selectedExample != null) ...[
                    const SizedBox(height: 32),
                    _buildExampleForm(_selectedExample!),
                  ],
                  const SizedBox(height: 32),
                  _buildGeneratedScript(),
                  const SizedBox(height: 32),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleForm(ScriptLibraryExample example) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.validationCard,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.cardBorder),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Validation opener',
                style: GoogleFonts.nunito(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                example.validationOpener,
                style: GoogleFonts.nunito(
                  fontSize: 15,
                  color: AppColors.textPrimary,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        _buildSectionTitle(
          'Step 1: Validation',
          'Choose ${example.becauseCount} "because" statements from the list below.',
        ),
        _buildMultiSelect(
          example.becauseStatements,
          _libraryBecause,
          example.becauseCount,
        ),
        const SizedBox(height: 32),
        _buildSectionTitle(
          'Step 2: Emotional Support',
          'Choose at least ${example.emotionalCount} sentences.',
        ),
        _buildOptionMultiSelect(
          example.emotionalSupport,
          _libraryEmotional,
          example.emotionalSupport.length,
        ),
        const SizedBox(height: 32),
        _buildSectionTitle(
          'Step 3: Practical Support',
          'Choose up to ${example.practicalCount} suggestions.',
        ),
        _buildOptionMultiSelect(
          example.practicalSupport,
          _libraryPractical,
          example.practicalCount,
        ),
        const SizedBox(height: 16),
        Text(
          example.sourceReference,
          style: GoogleFonts.nunito(
            fontSize: 11,
            color: AppColors.textLight,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  Widget _buildOptionMultiSelect(
      List<CategorizedOption> options,
      List<String> selected,
      int maxSelection,
      ) {
    return Wrap(
      spacing: 8,
      runSpacing: 6,
      children: options.map((option) {
        final isSelected = selected.contains(option.text);
        return ChoiceChip(
          label: Text(option.text),
          selected: isSelected,
          onSelected: (_) {
            setState(() {
              if (isSelected) {
                selected.remove(option.text);
              } else if (selected.length < maxSelection) {
                selected.add(option.text);
              }
              _updateScript();
            });
          },
          backgroundColor: AppColors.surface,
          selectedColor: AppColors.primary,
          labelStyle: GoogleFonts.nunito(
            color: isSelected ? Colors.white : AppColors.textPrimary,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
            fontSize: 13,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: isSelected ? AppColors.primary : AppColors.cardBorder,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        );
      }).toList(),
    );
  }

  Widget _buildSectionTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.nunito(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: GoogleFonts.nunito(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildMultiSelect(
      List<String> items,
      List<String> selected,
      int maxSelection,
      ) {
    return Wrap(
      spacing: 8,
      runSpacing: 6,
      children: items.map((item) {
        final isSelected = selected.contains(item);
        return ChoiceChip(
          label: Text(item),
          selected: isSelected,
          onSelected: (_) {
            setState(() {
              if (isSelected) {
                selected.remove(item);
              } else if (selected.length < maxSelection) {
                selected.add(item);
              }
              _updateScript();
            });
          },
          backgroundColor: AppColors.surface,
          selectedColor: AppColors.primary,
          labelStyle: GoogleFonts.nunito(
            color: isSelected ? Colors.white : AppColors.textPrimary,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
            fontSize: 13,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: isSelected ? AppColors.primary : AppColors.cardBorder,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        );
      }).toList(),
    );
  }

  Widget _buildGeneratedScript() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(12),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.menu_book_rounded,
                color: AppColors.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Your Validation and Support Script',
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            _hasCompleteScript
                ? _generatedScript.trim().replaceAll(RegExp(r'\s+'), ' ')
                : 'Your script will appear here once the required fields are complete...',
            style: GoogleFonts.nunito(
              fontSize: 15,
              color: _hasCompleteScript
                  ? AppColors.textPrimary
                  : AppColors.textLight,
              height: 1.6,
              fontStyle: _hasCompleteScript
                  ? FontStyle.normal
                  : FontStyle.italic,
            ),
          ),
          const SizedBox(height: 20),
          if (_hasCompleteScript)
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Clipboard.setData(
                    ClipboardData(
                      text: _generatedScript.trim().replaceAll(
                        RegExp(r'\s+'),
                        ' ',
                      ),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Script copied to clipboard')),
                  );
                },
                icon: const Icon(Icons.copy_all_outlined, size: 18),
                label: const Text('Copy Script'),
              ),
            ),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1, end: 0);
  }
}