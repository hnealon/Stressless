import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

// --- Data Model --------------------------------------------------------------

class LearnTopic {
  final String id;
  final String title;
  final IconData icon;
  final Color color;
  final List<LearnSection> sections;

  const LearnTopic({
    required this.id,
    required this.title,
    required this.icon,
    required this.color,
    required this.sections,
  });
}

class LearnSection {
  final String heading;
  final String body;
  final String? body2; // Optional second body
  final List<String>? bullets;
  final String? callout;
  final bool showTableAfter;

  const LearnSection({
    required this.heading,
    required this.body,
    this.body2,
    this.bullets,
    this.callout,
    this.showTableAfter = false,
  });
}

// --- Content ------------------------------------------------------------------

const List<LearnTopic> _topics = [
  LearnTopic(
    id: 'overview',
    title: 'The EFFT Framework',
    icon: Icons.hub_outlined,
    color: Color(0xFF4A7C6F),
    sections: [
      LearnSection(
        heading: 'A small shift can change the moment',
        body:
            'When children are stressed or distressed, their ability to think clearly and problem-solve becomes limited. Validation and support can help move things forward in a good way.',
        callout:
            'The validation and support framework is quick, learnable and can help bring your child\'s brain to a more flexible state.',
        showTableAfter: true,
      ),
      LearnSection(
        heading: 'What caregivers gain',
        body:
            'When you validate before you fix or reassure, something can shift for your child and for you.',
        bullets: [
          'More flexibility and cooperation over time',
          'More confidence handling big emotions, yours and theirs',
          'A stronger sense of connection, even in difficult moments',
        ],
      ),
      LearnSection(
        heading: 'The 45-second loop',
        body:
            'The full Validation and Support framework can take as little as 45 seconds. It has two steps: validate first, then support. That\'s it. The more you practise, the more natural it becomes.',
      ),
      LearnSection(
        heading: 'Why Order Matters',
        body:
            'The order of operations is essential for success. Validation -> Emotional Support -> Practical Support follows the neural requirements for moving from a state of stress or threat to a state of increased connectedness and flexibility.',
        body2:
            'If the order is reversed (e.g., giving advice before validation), the brain’s threat detection remains active, and the thinking brain (or pre-frontal cortex) never fully engages, leading to unproductive conversation and increased distress.',
      ),
      LearnSection(
        heading: 'Adapting the Framework',
        body:
            'We suggest you learn the framework, then adapt its delivery depending on your child’s personality, sensitivities, etc., including where they are at on the continuum of need:',
        bullets: [
          'Sometimes a quick validation + 1 because-statement can be enough to shift things in a meaningful direction. Other times, you might need to do a few rounds of because-statements, + emotional and practical support for your child to de-escalate and trust your efforts.',
          '“Drive-thru” validation with just one because-statement (and nothing more) might be the place to start for some kids who feel awkward with validation or emotion-talk. \nWhichever is true for you, our suggestion is for you to learn the framework to acquire the skill anddevelop fluency and then the capacity for discernment in its application will come with time and practice.',
        ],
      ),
    ],
  ),

  LearnTopic(
    id: 'automatic-responses',
    title: 'Automatic Responses',
    icon: Icons.psychology_outlined,
    color: Color(0xFFBF7B5E),
    sections: [
      LearnSection(
        heading: 'What is an automatic response?',
        body:
            'It is common for caregivers to engage in automatic responses when a child is upset. These are deeply conditioned, and can feel natural, but they aren\'t always effective and can sometimes cause problems.',
      ),
      LearnSection(
        heading: 'Common automatic responses',
        body: 'You might recognise one or more of these in yourself:',
        bullets: [
          'Reassuring: "You\'ll be fine! You\'re so good at this."',
          'Problem-solving: "Let\'s make a plan right now."',
          'Rationalising: "It\'s not as bad as it seems."',
          'Distraction: "How about we watch a movie?"',
          'Cheerleading: "You\'ve got this! I believe in you."',
          'Looking on the bright side: "At least..."',
          '"But"-ing: "I hear you, but..."',
        ],
        callout:
            'These reactions aren\'t wrong, but they work better after your child\'s brain is in a more flexible state.',
      ),
      LearnSection(
        heading: 'Why noticing matters',
        body:
            'The first step in reducing your reliance on automatic responses is simply awareness. Once you notice your tendency to go there, you have a choice to try validation instead. Once validation opens the door, you can then consider one of the above-responses and it is likely to go better.',
      ),
    ],
  ),

  LearnTopic(
    id: 'validation',
    title: 'Step 1: Validation',
    icon: Icons.favorite_border_rounded,
    color: Color(0xFF4A7C6F),
    sections: [
      LearnSection(
        heading: 'Help Their Brain Feel Safe',
        body:
            'When a child is upset, no matter the reason, their brain becomes activated and they can\'t think (as) clearly. Validation sends a simple signal:” I get it, I\'m not against you”. Especially when using a tentative, caring tone ("I can understand you might be frustrated because..."), a validating statementhelps them begin to process what they\'re experiencing as well. When they feel your genuine attempt to understand what’s going on for them, even if you are off the mark, they are more likely to be more open and maybe even more flexible too.',
      ),
      LearnSection(
        heading: 'What validation really means',
        body:
            'Validation involves making an effort to understand your child\'s experience, whether it\'s an emotion, a thought, an urge, a behaviour, or a state, and from their point of view.',
        callout:
            'You\'re not necessarily agreeing with them. You\'re showing you get why it makes sense from inside of their experience. That opens the door.',
      ),
      LearnSection(
        heading: 'More than just feelings',
        body:
            'Most caregivers think validation means has to do with emotions. But you can validate almost anything:',
        bullets: [
          'Feelings: “I feel sad, mad, ashamed, lonely, afraid”',
          'Attitudes: "This is stupid." "There\'s no point."',
          'Urges: "I want to quit." "I don\'t want to go."',
          'Behaviours: outbursts, withdrawal, aggression',
          'States: overwhelm, fatigue, silence, sensory overload',
        ],
      ),
      LearnSection(
        heading: 'How to build a validation statement',
        body:
            'Start with a sentence starter, add a verb, and then three because-statements to convey your effort to understand their experience from their point of view.',
      ),
      LearnSection(
        heading: 'Sentence starters',
        body: 'Choose one that feels authentic to you:',
        bullets: [
          '"I could understand you might..."',
          '"I can imagine you..."',
          '"No wonder you..."',
          '"It makes sense that you..."',
          '"I will never fully understand, but when I try to put myself in your shoes, I imagine you..."',
          '"When I try to see it from your perspective, I imagine you might..."',
        ],
      ),
      LearnSection(
        heading: 'Followed by a verb',
        body: 'feel / think / want to / don’t want to / not want to',
        callout: 'Example: "I can imagine you don’t want to stop playing on your tablet..."',
      ),
      LearnSection(
        heading: 'The power of because-statements',
        body:
            'Because-statements are the heart of validation. They show your child that you\'ve thought about their experience from the inside.',
        bullets: [
          'Aim for 3 because-statements',
          'End each one with a downward tone, not a question',
          'The most powerful ones reflect your child’s normal urge to increase good feelings, decrease hard feelings and increase feelings of connection                When in doubt, use the 3 Hs: "it\'s hard", "it\'s heavy", "it hurts"',
        ],
        callout:
            '"No wonder you feel that way because it\'s hard, and it\'s heavy, and it might really hurt."',
      ),
    ],
  ),

  LearnTopic(
    id: 'emotional_support',
    title: 'Step 2A: Emotional Support',
    icon: Icons.volunteer_activism_outlined,
    color: Color(0xFF7B68AB),
    sections: [
      LearnSection(
        heading: 'Build the Bridge',
        body:
            'Once they\'re a little calmer, or feel like you\'re on the same team, they need to feel your warmth before they can open up further. Communications of comfort, encouragement, reassurance and togetherness are great options. Without this step, any suggestion you offer may feel like pressure, or unwelcome, or just too soon.',
      ),
      LearnSection(
        heading: 'Choose 2–3 of these options',
        body:
            'These emotional support sentences will let your child know that they are not alone.',
        bullets: [
          'Comfort / Love - Loving words, a hug, or a hand on the shoulder',
          'Reassurance / Instillation of hope - "It\'s going to be okay." / "I believe it will get easier."',
          'Positive regard - "I know you\'re doing the best you can right now."',
          'Belief in them - "I believe in you." / "I know you can do this."',
          'Togetherness - "We\'re in this together." / "I want the best for you too."',
          'Sharing a perspective - "Did you know...?" / "From my end, I..."',
          'Space with a plan - "Why don\'t we take 5 and come back to it?"',
        ],
        callout:
            'When it comes to the number of emotional sentences, follow your child\'s lead. Some moments call for a one or two emotional support sentences, others for longer presence.',
      ),
    ],
  ),

  LearnTopic(
    id: 'practical_support',
    title: 'Step 2B: Practical Support',
    icon: Icons.handshake_outlined,
    color: Color(0xFF5B8FC9),
    sections: [
      LearnSection(
        heading: 'Getting Practical',
        body:
            'Practical support works best once your child feels heard and feels connected. Offered too early, even the most helpful suggestion can feel like you\'re skipping over their experience, and their walls can go up or they can retreat in their shell.. When a child feels both understood and feels connected, even if just a bit, they become more open to thinking through the problem with you, or hearing what you have to say - whether that\'s finding a solution, trying something new, or simply shifting gears with a transition.',
      ),
      LearnSection(
        heading: 'Types of practical support',
        body: 'Choose 1–2 of these options:',
        bullets: [
          'A behavioural plan or next step',
          'A soothing activity (a walk, music, a movie)',
          'A plan to reconnect or spend time together',
          'Sharing a skill, brainstorming, or offering to take over',
          'Naming a limit or a behavioural expectation',
        ],
      ),
      LearnSection(
        heading: 'Sometimes nothing more is needed',
        body:
            'Once a child feels validated and emotionally supported, the moment may already be complete. resence alone can be the most powerful thing you offer.',
        callout:
            '"Right now, I can just be with you." This is a complete and valid response.',
      ),
    ],
  ),
  LearnTopic(
    id: 'questions_suggestions',
    title: 'Questions vs. Suggestions',
    icon: Icons.question_answer_outlined,
    color: Color(0xFF5B8FC9),
    sections: [
      LearnSection(
        heading: 'Questions are great... and...',
        body:
            'This framework uses educated guesses (e.g. "I can imagine you might feel...") instead of questions ("How do you feel?") for a specific reason. Here are some potential benefits of making educated guesses or suggestions:',
      ),
      LearnSection(
        heading: 'Benefits for Validation',
        body: 'Suggestions can be helpful when a child has:',
        bullets: [
          'A limited vocabulary for emotions or lacks clarity about their internal experience',
          'Clarity about their internal experience, but feels embarassed expressing what’s inside',
        ],
      ),
      LearnSection(
        heading: 'Benefits for Support',
        body: 'Suggestions can also be helpful for support when a child has:',
        bullets: [
          'A lack of clarity about what they need',
          'Clarity about needing support, but feels embarassed asking for it',
        ],
        callout:
            'That said, questions are not wrong. Feel free to use questions if they feel useful to you and your child.',
      ),
    ],
  ),
  LearnTopic(
    id: 'therapeutic-apology',
    title: 'Therapeutic Apology',
    icon: Icons.favorite_outline,
    color: Color(0xFF6C63FF),
    sections: [
      LearnSection(
        heading: 'What is a Therapeutic Apology?',
        body:
        'Placeholder content. This text will be replaced with client-provided material.',
      ),
      LearnSection(
        heading: 'Step 1: Taking Responsibility',
        body:
        'Placeholder explanation of taking responsibility.',
      ),
      LearnSection(
        heading: 'Step 2: Acknowledging Impact',
        body:
        'Placeholder explanation of acknowledging impact.',
      ),
      LearnSection(
        heading: 'Step 3: Repair and Reconnection',
        body:
        'Placeholder explanation of repair and reconnection.',
      ),
    ],
  ),
];



// --- Main Screen --------------------------------------------------------------

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // --- Header ---------------------------------------
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LEARN',
                      style: GoogleFonts.nunito(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                        letterSpacing: 1.4,
                      ),
                    ).animate().fadeIn(duration: 300.ms),
                    const SizedBox(height: 4),
                    Text(
                      'The EFFT framework,\nexplained.',
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                        height: 1.15,
                      ),
                    ).animate().fadeIn(delay: 80.ms, duration: 400.ms),
                    const SizedBox(height: 10),
                    Text(
                      'Tap any topic to learn more. Each section is a short, focused read.',
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

            // --- Topic cards -----------------------------------
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final topic = _topics[index];
                  return _TopicCard(topic: topic, index: index);
                }, childCount: _topics.length),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 32)),
          ],
        ),
      ),
    );
  }
}

// --- Topic Card (list item) ---------------------------------------------------

class _TopicCard extends StatelessWidget {
  final LearnTopic topic;
  final int index;

  const _TopicCard({required this.topic, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => _TopicDetailScreen(topic: topic)),
        );
      },
      child:
          Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.cardBorder),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: topic.color.withAlpha(20),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(topic.icon, color: topic.color, size: 22),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            topic.title,
                            style: GoogleFonts.nunito(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 14,
                      color: AppColors.textLight,
                    ),
                  ],
                ),
              )
              .animate()
              .fadeIn(delay: Duration(milliseconds: 100 + index * 70))
              .slideX(begin: 0.06, end: 0),
    );
  }
}

// --- Topic Detail Screen ------------------------------------------------------

class _TopicDetailScreen extends StatelessWidget {
  final LearnTopic topic;

  const _TopicDetailScreen({required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(topic.title),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          children: [
            // --- Topic header ---------------------------------
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: topic.color.withAlpha(20),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(topic.icon, color: topic.color, size: 26),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        topic.title,
                        style: GoogleFonts.cormorantGaramond(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ).animate().fadeIn(duration: 300.ms),

            const SizedBox(height: 8),
            Divider(color: AppColors.divider, height: 32),

            // --- Sections -------------------------------------
            ...topic.sections.asMap().entries.map((entry) {
              final i = entry.key;
              final section = entry.value;
              return _SectionBlock(
                section: section,
                accentColor: topic.color,
                index: i,
              );
            }),

            const SizedBox(height: 16),

            OutlinedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_rounded, size: 16),
              label: const Text('Back to topics'),
            ).animate().fadeIn(delay: 400.ms, duration: 300.ms),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// --- Section Block ------------------------------------------------------------

class _SectionBlock extends StatelessWidget {
  final LearnSection section;
  final Color accentColor;
  final int index;

  const _SectionBlock({
    required this.section,
    required this.accentColor,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Widget buildTableCell(String text, {bool isHeader = false}) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          text,
          style: GoogleFonts.nunito(
            fontSize: 13,
            fontWeight: isHeader ? FontWeight.w700 : FontWeight.normal,
            color: isHeader ? AppColors.textPrimary : AppColors.textSecondary,
          ),
        ),
      );
    }

    Widget buildTheActualTable() {
      final rows = [
        ['Step 1', 'Validation', '↓ Amygdala', 'From Threat to Safe'],
        ['Step 2A', 'Emotional Support', '↑ Oxytocin (Relational)', 'From Safe to Connected'],
        ['Step 2B', 'Practical Support', '↑ Prefrontal Cortex (Cognitive)', 'From Connected to Active'],
      ];
      return Table(
        border: TableBorder.all(color: AppColors.cardBorder, width: 1.5),
        columnWidths: const {
          0: IntrinsicColumnWidth(),
          1: FlexColumnWidth(),
          2: FlexColumnWidth(),
          3: FlexColumnWidth(),
        },
        children: [
          TableRow(
            decoration: BoxDecoration(color: AppColors.surface),
            children: [
              buildTableCell('Step', isHeader: true),
              buildTableCell('Action', isHeader: true),
              buildTableCell('Neural Focus', isHeader: true),
              buildTableCell('State', isHeader: true),
            ],
          ),
          ...rows.map((row) => TableRow(
                children: [
                  buildTableCell(row[0]),
                  buildTableCell(row[1]),
                  buildTableCell(row[2]),
                  buildTableCell(row[3]),
                ],
              ))
        ],
      );
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.heading,
            style: GoogleFonts.nunito(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          if (section.body.isNotEmpty)
            Text(
              section.body,
              style: GoogleFonts.nunito(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.7,
              ),
            ),
          if (section.body2 != null) ...[
            const SizedBox(height: 8),
            Text(
              section.body2!,
              style: GoogleFonts.nunito(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.7,
              ),
            ),
          ],
          if (section.bullets != null) ...[
            const SizedBox(height: 10),
            ...section.bullets!.map(
              (bullet) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      margin: const EdgeInsets.only(top: 6, right: 10),
                      decoration: BoxDecoration(
                        color: accentColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        bullet,
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          if (section.callout != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: accentColor.withAlpha(20),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: accentColor.withAlpha(50)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.format_quote_rounded,
                    color: accentColor,
                    size: 18,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      section.callout!,
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: AppColors.textPrimary,
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (section.showTableAfter) ...[
            const SizedBox(height: 16),
            buildTheActualTable(),
          ],
        ],
      ),
    ).animate().fadeIn(delay: Duration(milliseconds: 80 + index * 60)).slideY(begin: 0.05, end: 0);
  }
}
