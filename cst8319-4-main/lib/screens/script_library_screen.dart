import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../data/script_library_data.dart';
import '../models/script_library_example.dart';

class _AppColors {
  static const Color primary = Color(0xFF6B8E23);
  static const Color background = Color(0xFFF7F9F6);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardBorder = Color(0xFFE2E8F0);
  static const Color textPrimary = Color(0xFF1A202C);
  static const Color textSecondary = Color(0xFF4A5568);
  static const Color textLight = Color(0xFF718096);
}

class ScriptLibraryScreen extends StatefulWidget {
  const ScriptLibraryScreen({super.key});

  @override
  State<ScriptLibraryScreen> createState() => _ScriptLibraryScreenState();
}

class _ScriptLibraryScreenState extends State<ScriptLibraryScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';
  String _searchText = '';

  List<String> get _categories {
    final emotions = scriptLibraryEmotions;
    return ['All', ...emotions];
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<ScriptLibraryExample> get _filteredScripts {
    return scriptLibraryExamples.where((script) {
      final matchesCategory = _selectedCategory == 'All' ||
          script.emotion.toLowerCase() == _selectedCategory.toLowerCase();

      final search = _searchText.trim();
      if (search.isEmpty) return matchesCategory;

      final matchesSearch = script.title.toLowerCase().contains(search) ||
          script.emotion.toLowerCase().contains(search) ||
          script.validationOpener.toLowerCase().contains(search) ||
          script.becauseStatements.any((s) => s.toLowerCase().contains(search)) ||
          script.emotionalSupport.any((e) => e.text.toLowerCase().contains(search)) ||
          script.practicalSupport.any((p) => p.text.toLowerCase().contains(search));

      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredScripts = _filteredScripts;

    return Scaffold(
      backgroundColor: _AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: _AppColors.textPrimary),
                      onPressed: () => Navigator.of(context).pop(),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      alignment: Alignment.centerLeft,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'MORE PRACTICE',
                      style: GoogleFonts.nunito(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: _AppColors.primary,
                        letterSpacing: 1.4,
                      ),
                    ).animate().fadeIn(duration: 300.ms),
                    const SizedBox(height: 4),
                    Text(
                      'Browse validation scripts',
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                        color: _AppColors.textPrimary,
                        height: 1.15,
                      ),
                    ).animate().fadeIn(delay: 80.ms, duration: 400.ms),
                    const SizedBox(height: 10),
                    Text(
                      'Search or browse scripts based on the validation and support framework.',
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        color: _AppColors.textSecondary,
                        height: 1.6,
                      ),
                    ).animate().fadeIn(delay: 160.ms, duration: 400.ms),
                    const SizedBox(height: 20),
                    _buildSearchField(),
                    const SizedBox(height: 18),
                    _buildCategoryChips(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: filteredScripts.isEmpty
                  ? SliverToBoxAdapter(child: _buildEmptyState())
                  : SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final script = filteredScripts[index];
                    return _buildScriptCard(script, index);
                  },
                  childCount: filteredScripts.length,
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      style: GoogleFonts.nunito(
        fontSize: 14,
        color: _AppColors.textPrimary,
      ),
      decoration: InputDecoration(
        hintText: 'Search by topic or situation...',
        hintStyle: GoogleFonts.nunito(color: _AppColors.textLight),
        prefixIcon: const Icon(Icons.search, color: _AppColors.primary),
        filled: true,
        fillColor: _AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _AppColors.cardBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _AppColors.cardBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _AppColors.primary, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    ).animate().fadeIn(delay: 220.ms, duration: 400.ms);
  }

  Widget _buildCategoryChips() {
    return Wrap(
      spacing: 8,
      runSpacing: 6,
      children: _categories.map((category) {
        final isSelected = category == _selectedCategory;

        return ChoiceChip(
          label: Text(category),
          selected: isSelected,
          onSelected: (_) {
            setState(() {
              _selectedCategory = category;
            });
          },
          backgroundColor: _AppColors.surface,
          selectedColor: _AppColors.primary,
          labelStyle: GoogleFonts.nunito(
            color: isSelected ? Colors.white : _AppColors.textPrimary,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
            fontSize: 13,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: isSelected ? _AppColors.primary : _AppColors.cardBorder,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        );
      }).toList(),
    ).animate().fadeIn(delay: 260.ms, duration: 400.ms);
  }

  Widget _buildScriptCard(ScriptLibraryExample script, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: _AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _AppColors.cardBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(12),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          childrenPadding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
          title: Text(
            script.title,
            style: GoogleFonts.cormorantGaramond(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: _AppColors.textPrimary,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              script.validationOpener,
              style: GoogleFonts.nunito(
                fontSize: 13,
                color: _AppColors.textSecondary,
              ),
            ),
          ),
          leading: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: _AppColors.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              script.emotion,
              style: GoogleFonts.nunito(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: _AppColors.primary,
              ),
            ),
          ),
          children: [
            const Divider(height: 20, color: _AppColors.cardBorder),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Validation Opener:',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w700,
                      color: _AppColors.primary,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    script.validationOpener,
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      color: _AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Because Statements:',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w700,
                      color: _AppColors.primary,
                      fontSize: 13,
                    ),
                  ),
                  ...script.becauseStatements.map(
                        (b) => Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        '• $b',
                        style: GoogleFonts.nunito(
                          fontSize: 13,
                          color: _AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Emotional Support:',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w700,
                      color: _AppColors.primary,
                      fontSize: 13,
                    ),
                  ),
                  ...script.emotionalSupport.map(
                        (e) => Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        '• [${e.category}] ${e.text}',
                        style: GoogleFonts.nunito(
                          fontSize: 13,
                          color: _AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Practical Support:',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w700,
                      color: _AppColors.primary,
                      fontSize: 13,
                    ),
                  ),
                  ...script.practicalSupport.map(
                        (p) => Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        '• [${p.category}] ${p.text}',
                        style: GoogleFonts.nunito(
                          fontSize: 13,
                          color: _AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(
      delay: (50 * (index % 5)).ms,
      duration: 350.ms,
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.search_off_rounded,
            size: 48,
            color: _AppColors.textLight,
          ),
          const SizedBox(height: 12),
          Text(
            'No scripts found',
            style: GoogleFonts.cormorantGaramond(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: _AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Try adjusting your keywords or category filters.',
            style: GoogleFonts.nunito(
              fontSize: 14,
              color: _AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}