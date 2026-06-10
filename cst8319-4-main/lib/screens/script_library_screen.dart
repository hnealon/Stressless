import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme.dart';

// This screen is for SWF1: searchable script library.
// It allows caregivers to search and browse placeholder scripts by situation.
class ScriptLibraryScreen extends StatefulWidget {
  const ScriptLibraryScreen({super.key});

  @override
  State<ScriptLibraryScreen> createState() => _ScriptLibraryScreenState();
}

class _ScriptLibraryScreenState extends State<ScriptLibraryScreen> {
  // Controller used to read what the user types in the search bar.
  final TextEditingController _searchController = TextEditingController();

  // Keeps track of the selected category chip.
  String _selectedCategory = 'All';

  // Stores the search text in lowercase so searching is easier.
  String _searchText = '';

  // Categories based on the client requirement examples.
  final List<String> _categories = [
    'All',
    'Refusal to Eat',
    'Silence/Withdrawal',
    'Anger',
    'Body Image',
    'Therapy Resistance',
  ];

  // Placeholder script data.
  // The client can replace these with final approved scripts later.
  final List<Map<String, String>> _scripts = [
    {
      'title': 'Refusal to Eat',
      'category': 'Refusal to Eat',
      'situation': 'When a child refuses to eat or feels overwhelmed at mealtime.',
      'script':
      'I can understand that eating feels really hard right now. It makes sense that you might feel overwhelmed because this moment feels like too much. I am here with you, and we can take this one step at a time.',
    },
    {
      'title': 'Silence or Withdrawal',
      'category': 'Silence/Withdrawal',
      'situation': 'When a child becomes quiet, shuts down, or pulls away.',
      'script':
      'I can imagine that talking right now might feel difficult. It makes sense that you may need space because this feels heavy. I am here with you, and you do not have to explain everything right away.',
    },
    {
      'title': 'Anger Response',
      'category': 'Anger',
      'situation': 'When a child reacts with anger, frustration, or yelling.',
      'script':
      'I can understand that you might feel really angry right now. No wonder this feels upsetting because something important is happening for you. I want to understand, and I am here to help when you are ready.',
    },
    {
      'title': 'Body Image Concern',
      'category': 'Body Image',
      'situation': 'When a child is upset about their body or appearance.',
      'script':
      'I can imagine you are feeling really uncomfortable right now. I want you to know that I am listening, and I care about what this feels like for you. You do not have to handle this feeling alone.',
    },
    {
      'title': 'Therapy Resistance',
      'category': 'Therapy Resistance',
      'situation': 'When a child does not want to attend therapy or accept support.',
      'script':
      'It makes sense that therapy might feel uncomfortable or frustrating. I can understand that part of you may not want to go because it feels hard to talk about these things. I am here with you, and we can figure out what support feels manageable.',
    },
  ];

  @override
  void initState() {
    super.initState();

    // Every time the user types, update the search text and rebuild the list.
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    // Frees memory when this screen is closed.
    _searchController.dispose();
    super.dispose();
  }

  // Filters scripts by selected category and search text.
  List<Map<String, String>> get _filteredScripts {
    return _scripts.where((script) {
      final matchesCategory =
          _selectedCategory == 'All' || script['category'] == _selectedCategory;

      final matchesSearch =
          script['title']!.toLowerCase().contains(_searchText) ||
              script['category']!.toLowerCase().contains(_searchText) ||
              script['situation']!.toLowerCase().contains(_searchText) ||
              script['script']!.toLowerCase().contains(_searchText);

      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredScripts = _filteredScripts;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header section.
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
                      'Browse parent-written scripts.',
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                        height: 1.15,
                      ),
                    ).animate().fadeIn(delay: 80.ms, duration: 400.ms),
                    const SizedBox(height: 10),
                    Text(
                      'Search or browse scripts by topic. These are placeholder scripts until the client provides the final edited content.',
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        color: AppColors.textSecondary,
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

            // Script list section.
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

  // Builds the search bar.
  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      style: GoogleFonts.nunito(
        fontSize: 14,
        color: AppColors.textPrimary,
      ),
      decoration: InputDecoration(
        hintText: 'Search by topic or situation...',
        hintStyle: GoogleFonts.nunito(color: AppColors.textLight),
        prefixIcon: const Icon(Icons.search, color: AppColors.primary),
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.cardBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.cardBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    ).animate().fadeIn(delay: 220.ms, duration: 400.ms);
  }

  // Builds the category filter buttons.
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
    ).animate().fadeIn(delay: 260.ms, duration: 400.ms);
  }

  // Builds one expandable script card.
  Widget _buildScriptCard(Map<String, String> script, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
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
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        childrenPadding: const EdgeInsets.only(top: 12),
        iconColor: AppColors.primary,
        collapsedIconColor: AppColors.textSecondary,
        title: Text(
          script['title']!,
          style: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            script['category']!,
            style: GoogleFonts.nunito(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
        ),
        children: [
          _buildCardLabel('Situation'),
          const SizedBox(height: 6),
          _buildCardText(script['situation']!),
          const SizedBox(height: 14),
          _buildCardLabel('Placeholder Script'),
          const SizedBox(height: 6),
          _buildCardText(script['script']!),
        ],
      ),
    ).animate().fadeIn(delay: (120 * index).ms).slideY(begin: 0.08, end: 0);
  }

  // Small title used inside each script card.
  Widget _buildCardLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: GoogleFonts.nunito(
          fontSize: 14,
          fontWeight: FontWeight.w800,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  // Paragraph text used inside each script card.
  Widget _buildCardText(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: GoogleFonts.nunito(
          fontSize: 14,
          color: AppColors.textSecondary,
          height: 1.6,
        ),
      ),
    );
  }

  // Message shown when no script matches the search/category.
  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Text(
        'No scripts found. Try another search or category.',
        style: GoogleFonts.nunito(
          fontSize: 14,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}