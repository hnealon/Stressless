import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

// Self-contained design tokens to clear any external theme file mismatch errors
class _AppColors {
  static const Color primary = Color(0xFF6B8E23);       // Sage Green primary
  static const Color background = Color(0xFFF7F9F6);    // Cream/Neutral background
  static const Color surface = Color(0xFFFFFFFF);       // Clean white for cards
  static const Color cardBorder = Color(0xFFE2E8F0);    // Light grey border
  static const Color textPrimary = Color(0xFF1A202C);   // Deep charcoal for main text
  static const Color textSecondary = Color(0xFF4A5568); // Soft grey for descriptions
  static const Color textLight = Color(0xFF718096);     // Muted grey for hints
}

// This screen handles the searchable more practice library inside the Practice tab.
class ScriptLibraryScreen extends StatefulWidget {
  const ScriptLibraryScreen({super.key});

  @override
  State<ScriptLibraryScreen> createState() => _ScriptLibraryScreenState();
}

class _ScriptLibraryScreenState extends State<ScriptLibraryScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';
  String _searchText = '';

  // Filter categories map exactly to the framework emotions
  final List<String> _categories = [
    'All',
    'Hopelessness',
    'Sadness',
    'Anxiety',
  ];

  // Full updated production script collection matching your exact dataset
  final List<Map<String, String>> _scripts = [
    // --- HOPELESSNESS ---
    {
      'title': 'Nothing Will Ever Change',
      'category': 'Hopelessness',
      'situation': 'When the child feels like things will never get better.',
      'script': 'Validation: I can understand why you feel hopeless right now because you have been trying for such a long time with not enough relief, because you are exhausted from carrying this, and because it might be hard to imagine what better would look like right now.\n\n'
          'Emotional support: You do not have to face this by yourself. I am right here and I am not going anywhere. I can see how tired you are, and you do not have to keep carrying this alone.\n\n'
          'Practical support: Let us choose one tiny thing we can do together today. Something small that feels doable.',
    },
    {
      'title': 'Nothing I Do Matters',
      'category': 'Hopelessness',
      'situation': 'When the child feels like their effort does not make a difference.',
      'script': 'Validation: I understand why you would feel hopeless because you have been putting in so much effort and it does not seem to be paying off, because it can feel like there is no point in trying when nothing seems to help, and because that feeling is painful and exhausting.\n\n'
          'Emotional support: Your efforts matter to me, far more than you can see right now. I notice how hard you try, and I am proud of you.\n\n'
          'Practical support: Let us name one small thing that came from your effort, even if it feels tiny.',
    },
    {
      'title': 'Feeling Like a Burden',
      'category': 'Hopelessness',
      'situation': 'When the child worries that their struggles are too much for others.',
      'script': 'Validation: It makes sense you feel hopeless because you are worried your struggles are too much for the people around you, because you care about the people you love, and because carrying that worry is exhausting.\n\n'
          'Emotional support: You are not a burden to me. You are someone I love and want to support. Being here for you is not too much for me.\n\n'
          'Practical support: Let us talk about what kind of support feels okay for you. We can figure it out together.',
    },
    {
      'title': 'Feeling Like No One Understands',
      'category': 'Hopelessness',
      'situation': 'When the child feels unseen or misunderstood.',
      'script': 'Validation: I get why you feel hopeless because it feels like people cannot really see how bad it gets for you, because being unseen makes everything feel heavier, and because feeling understood is something we all need.\n\n'
          'Emotional support: I am trying to see you as clearly as I can. Your experience matters deeply to me. You are not invisible to me.\n\n'
          'Practical support: Can you help me understand even one part of how it feels? I am really listening.',
    },
    {
      'title': 'No Point in Trying at School',
      'category': 'Hopelessness',
      'situation': 'When school feels impossible or not worth trying.',
      'script': 'Validation: I can understand why you would feel hopeless about school because it has been hard, because working hard without seeing results is discouraging, and because when something feels impossible, the brain starts to ask why bother.\n\n'
          'Emotional support: I see how hard you have been trying and I am proud of you. Your worth is not measured by your grades.\n\n'
          'Practical support: Let us look together at what is making school feel hardest and figure out what support might actually help.',
    },
    {
      'title': 'Wanting to Quit Something They Once Loved',
      'category': 'Hopelessness',
      'situation': 'When the child wants to stop doing something they used to enjoy.',
      'script': 'Validation: I can understand why you would want to give up on this because what used to feel fun now feels hard or draining, because difficult experiences may have taken the joy out, and because sometimes stopping feels like the only way to get relief.\n\n'
          'Emotional support: I am not going to force anything. I can see how much this has been weighing on you. Whatever you decide, I am on your side.\n\n'
          'Practical support: Before you decide for good, would you want to take a break from it for a bit and see how you feel?',
    },

    // --- SADNESS ---
    {
      'title': 'Hurt by Something That Happened',
      'category': 'Sadness',
      'situation': 'When something happened that hurt the child emotionally.',
      'script': 'Validation: I can understand why you feel sad because what happened really hurt your heart, because you cared about this, and because the things that hurt us most are usually the things we care about most.\n\n'
          'Emotional support: I am right here. You do not have to carry this feeling alone. What you are feeling makes complete sense to me.\n\n'
          'Practical support: Do you want to talk about it, or would it help more just to be together quietly for a while?',
    },
    {
      'title': 'Grieving a Change or Loss',
      'category': 'Sadness',
      'situation': 'When the child is adjusting to a change or loss.',
      'script': 'Validation: It makes sense you are feeling sad because something important has shifted or gone, because you are missing what used to be, and because adjusting to a new normal takes time.\n\n'
          'Emotional support: Your sadness is welcome with me. Grief takes as long as it takes, and I will be here the whole way.\n\n'
          'Practical support: Would it help to talk about what you miss, or would you just like to be together for a while?',
    },
    {
      'title': 'Feeling Left Out or Unseen',
      'category': 'Sadness',
      'situation': 'When the child feels excluded, overlooked, or invisible.',
      'script': 'Validation: I understand your sadness because being overlooked really stings, because everyone wants to feel included, and because belonging is one of the most important needs we have.\n\n'
          'Emotional support: I see you. You matter deeply. You belong here, with me, fully and completely.\n\n'
          'Practical support: Can you tell me more about what happened so I can really understand?',
    },
    {
      'title': 'Not Knowing Why They Are Sad',
      'category': 'Sadness',
      'situation': 'When the child feels sad but does not know why.',
      'script': 'Validation: It is okay to feel sad even when you are not sure why, because emotions sometimes rise without a clear reason, because your body may be asking for care, and because you do not always need a reason to feel sad.\n\n'
          'Emotional support: I am right here with you. You do not need to have an explanation. Your feelings are always welcome here.\n\n'
          'Practical support: What would feel comforting right now, even something simple?',
    },
    {
      'title': 'Feeling Lonely',
      'category': 'Sadness',
      'situation': 'When the child feels alone or disconnected.',
      'script': 'Validation: I get why you feel sad because loneliness is one of the heaviest feelings, because connection matters so much, and because it hurts when you feel alone inside even when people are around.\n\n'
          'Emotional support: You are not alone right now. I am with you. I care about you and I want to be one of your people.\n\n'
          'Practical support: Can I sit close, or would doing something gentle together feel comforting?',
    },
    {
      'title': 'Tired and Emotionally Worn Down',
      'category': 'Sadness',
      'situation': 'When the child feels emotionally exhausted.',
      'script': 'Validation: It makes sense you feel sad because you have been carrying so much for so long, because your body and heart feel worn out, and because sadness often rises when we are exhausted.\n\n'
          'Emotional support: You do not have to be strong right now. I see how tired you are and I want to help carry some of this.\n\n'
          'Practical support: Let us choose one small comforting thing, like a blanket, a warm drink, or resting together.',
    },
    {
      'title': 'Processing a Big Change',
      'category': 'Sadness',
      'situation': 'When the child is dealing with a major change.',
      'script': 'Validation: I can see why you are sad because this change shook things up, because it takes time to let go of the way things were, and because your heart is adjusting to a new reality.\n\n'
          'Emotional support: I am here. You do not have to move through this shift alone. Take all the time you need.\n\n'
          'Practical support: Would you like to talk, rest, or just be still together for a bit?',
    },
    {
      'title': 'When Something Good Has Ended',
      'category': 'Sadness',
      'situation': 'When the child feels sad because something enjoyable has ended.',
      'script': 'Validation: I can understand why you would feel sad about this ending because something that brought you joy is now over, because good things ending can feel like a real loss, and because it is normal to miss something wonderful.\n\n'
          'Emotional support: The fact that you feel sad tells me how much this mattered. It is okay to miss something that was wonderful.\n\n'
          'Practical support: Can we plan something small to look forward to?',
    },
    {
      'title': 'Missing Someone',
      'category': 'Sadness',
      'situation': 'When the child misses someone important.',
      'script': 'Validation: I can understand why you are feeling sad because missing someone you love is painful, because they are not here in the way you need them right now, and because distance can feel really hard.\n\n'
          'Emotional support: Missing someone is a sign of love. I am sorry you are carrying this feeling right now. I am here with you.\n\n'
          'Practical support: Is there a way you could connect with them, even through a message or drawing?',
    },
    {
      'title': 'A Pet Has Died or Is Very Sick',
      'category': 'Sadness',
      'situation': 'When the child is grieving a pet.',
      'script': 'Validation: I can understand why your heart is sore because you loved them so much, because losing a pet is a real loss, and because they were an important part of your life.\n\n'
          'Emotional support: This is a real loss and it is okay to grieve it. Your love for them was real and beautiful.\n\n'
          'Practical support: Would you like to do something to remember them, like make something or look at pictures together?',
    },
    {
      'title': 'A Friendship Has Changed or Ended',
      'category': 'Sadness',
      'situation': 'When a friendship changes or ends.',
      'script': 'Validation: I can understand why you are so sad about this because friendships are important, because you cared about this person, and because losing that closeness hurts.\n\n'
          'Emotional support: This is a real loss and it is okay to grieve it. You were a good friend, and this does not change that.\n\n'
          'Practical support: Can you tell me more about what happened? I want to understand.',
    },

    // --- ANXIETY ---
    {
      'title': 'When Anxiety Spikes Suddenly',
      'category': 'Anxiety',
      'situation': 'When anxiety comes on quickly and feels intense.',
      'script': 'Validation: I can understand why you feel anxious right now because something felt uncertain or unsafe, because your nervous system reacted, and because anxiety can come on fast.\n\n'
          'Emotional support: I am right here. We can face this feeling together. You are safe right now, and I am not going anywhere.\n\n'
          'Practical support: Let us take a slow breath together and look around to notice what is safe right now.',
    },
    {
      'title': 'Dreading Something Upcoming',
      'category': 'Anxiety',
      'situation': 'When the child is worried about something coming up.',
      'script': 'Validation: It makes sense you are anxious because this matters to you, because the unknown feels big, and because part of you is trying to be prepared.\n\n'
          'Emotional support: You do not have to figure this out alone. I will walk with you through it. Whatever happens, I will be right here.\n\n'
          'Practical support: Let us break this into one tiny step and see what would help that first step feel manageable.',
    },
    {
      'title': 'Anxiety From Caring Too Much',
      'category': 'Anxiety',
      'situation': 'When the child feels anxious because they care deeply.',
      'script': 'Validation: I get why you feel anxious because you care deeply about how things go, because you want to do well, and because the things that matter most to us can make us anxious.\n\n'
          'Emotional support: The care inside your anxiety is something I respect. Caring this much is a quality I love about you.\n\n'
          'Practical support: Let us put that care to use by figuring out one small thing you can do right now.',
    },
    {
      'title': 'When Anxiety Feels Irrational but Very Real',
      'category': 'Anxiety',
      'situation': 'When the child knows the anxiety may not make sense but still feels it strongly.',
      'script': 'Validation: Your anxiety makes complete sense because your body reacted before your mind caught up, because anxiety does not need a logical reason to feel real, and because your nervous system is trying to protect you.\n\n'
          'Emotional support: I believe you. What you are feeling is real. You are not being dramatic or overreacting.\n\n'
          'Practical support: Can we name three things that are real and true about this moment?',
    },
    {
      'title': 'Overwhelmed by Too Many Possibilities',
      'category': 'Anxiety',
      'situation': 'When too many choices or unknowns feel overwhelming.',
      'script': 'Validation: I understand the anxiety because there are so many moving parts, because uncertainty stacks up fast, and because too many unknowns can feel like too much to hold.\n\n'
          'Emotional support: I am with you. You do not have to manage all those pieces alone. We can narrow this down together.\n\n'
          'Practical support: Let us choose the one or two things that matter most right now and start there.',
    },
    {
      'title': 'Afraid of Making a Mistake',
      'category': 'Anxiety',
      'situation': 'When the child is scared of choosing wrong or messing up.',
      'script': 'Validation: I can see why you are anxious because you want to make a good choice, because the stakes feel high, and because making a mistake might feel scary.\n\n'
          'Emotional support: Your anxiety shows your values. Whatever happens, we will be okay and we will figure it out together.\n\n'
          'Practical support: Let us explore the options together and see which one feels most right, not perfect.',
    },
    {
      'title': 'Anxiety in the Body',
      'category': 'Anxiety',
      'situation': 'When anxiety shows up as body feelings like a tight chest or racing heart.',
      'script': 'Validation: Your anxiety makes sense because your body is responding to something intense, because anxiety lives in the body, and because physical anxiety can feel scary.\n\n'
          'Emotional support: I am right here. You do not have to calm down right away. We are going to get through this feeling together.\n\n'
          'Practical support: Try putting your hand where it feels strongest and breathing slowly into that spot. Let us do it together.',
    },
    {
      'title': 'Worrying About Something That Has Not Happened',
      'category': 'Anxiety',
      'situation': 'When the child worries about something that has not happened yet.',
      'script': 'Validation: It makes sense to feel anxious because your mind is scanning ahead, because imagining the worst can be a way your brain tries to protect you, and because the feeling is real even if the worry has not happened.\n\n'
          'Emotional support: I am here, and we are going to deal with what is in front of us together. You are not alone in this.\n\n'
          'Practical support: Let us name the worry once, then name three things that are actually true and safe right now.',
    },
    {
      'title': 'Anxiety Linked to Past Experiences',
      'category': 'Anxiety',
      'situation': 'When current anxiety is connected to something hard from the past.',
      'script': 'Validation: I can understand your anxiety because this moment touches something familiar, because your body and brain remember painful things, and because anxiety is trying to protect you.\n\n'
          'Emotional support: What happened before is not what is happening now, and you are safe with me. I am not going to rush you.\n\n'
          'Practical support: Let us anchor in this present moment together. Where are we, who is here, and what is different now?',
    },
    {
      'title': 'School or Learning Feels Overwhelming',
      'category': 'Anxiety',
      'situation': 'When school feels stressful or too much.',
      'script': 'Validation: I can understand why you feel anxious about school because there is a lot expected of you, because school involves pressure, and because learning can feel hard when there is already a lot going on.\n\n'
          'Emotional support: I see how hard you are working, and I am proud of you. Your worth is not measured by how school is going.\n\n'
          'Practical support: Let us break down what feels most overwhelming and see if we can make any of it smaller.',
    },
    {
      'title': 'Social Situations Feel Scary',
      'category': 'Anxiety',
      'situation': 'When social situations feel unpredictable or scary.',
      'script': 'Validation: I can imagine why you feel anxious because social situations involve unpredictability, because you care what people think, and because you might worry about saying the wrong thing.\n\n'
          'Emotional support: Social stuff is genuinely hard, and you are not alone in finding it that way. What you are feeling makes complete sense.\n\n'
          'Practical support: Let us talk through what you are most worried about and see if we can prepare for it a little.',
    },
    {
      'title': 'Worried About Their Body or Health',
      'category': 'Anxiety',
      'situation': 'When the child is anxious about their body or health.',
      'script': 'Validation: I can understand why you feel anxious about this because your body is important to you, because body sensations can feel scary, and because uncertainty about health is hard.\n\n'
          'Emotional support: I take your concerns seriously and I want to help. We are going to look into this together.\n\n'
          'Practical support: Can you show me or describe what you are noticing so I can help figure out what to do?',
    },
    {
      'title': 'Bedtime or the Dark Feels Scary',
      'category': 'Anxiety',
      'situation': 'When bedtime, darkness, or nighttime feels scary.',
      'script': 'Validation: I can understand why bedtime feels hard because the dark and quiet can make worries feel bigger, because nighttime can feel overwhelming, and because your imagination can be active at night.\n\n'
          'Emotional support: You are safe, even when it does not feel that way. I love you and I want you to feel safe when you go to sleep.\n\n'
          'Practical support: Let us figure out something that helps your room feel safer at night, like a light, comfort object, or check-in routine.',
    },
  ];

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
      backgroundColor: _AppColors.background,
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

  Widget _buildScriptCard(Map<String, String> script, int index) {
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
            script['title'] ?? '',
            style: GoogleFonts.cormorantGaramond(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: _AppColors.textPrimary,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              script['situation'] ?? '',
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
              script['category'] ?? '',
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
              child: Text(
                script['script'] ?? '',
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  color: _AppColors.textPrimary,
                  height: 1.5,
                ),
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
