import 'package:flutter/material.dart';
import '../theme.dart';
import 'apology_script_builder_screen.dart';

class ApologyGuideScreen extends StatefulWidget {
  const ApologyGuideScreen({super.key});

  @override
  State<ApologyGuideScreen> createState() => _ApologyGuideScreenState();
}

class _ApologyGuideScreenState extends State<ApologyGuideScreen> {
  int _selectedStep = 0;

  final List<_StepData> _steps = [
    _StepData(
      number: '1',
      title: 'Acknowledge the hurt',
      body:
      'Start by naming what happened: the event, the pattern, or what was missing. '
          'Don\'t focus on your intentions – at least not yet. Even when you meant well, what matters most here is what your child '
          'actually experienced.',
      example: '',
      reactionExamples: [
        _ReactionExample(
          label: 'Examples:',
          quote:
          '"I want to talk to you about the times I got really overwhelmed and raised my voice at you in ways that weren\'t okay."\n\n'
              '"I want to talk to you about how I wasn\'t around very much during your 8th grade, and how hard that must have been."',
        ),
      ],
    ),
    _StepData(
      number: '2',
      title: 'Validate What It Must Have Been Like',
      body:
      'Now step into your child\'s shoes. What did this experience feel like for them? Not just with respect to one emotion, but across different core emotions. Think about what they might have felt in the moment, what they might have come to believe about themselves, what they might have wished were different, what they might have been afraid to say. '
          'Try to name 2 to 3 different emotions: sadness, fear, embarrassment and anger. The more specific this feels, the more your child will feel genuinely seen.',
      example:
      '"I imagine that my absence may have made you feel scared, not knowing how to reach out. Maybe sad too, really longing for my support. It might have made sense if you felt embarrassed, thinking there was something wrong with you, or that you were too sensitive. And I would understand if you would have felt anger too, even if you didn\'t feel safe to show it, since on some level you knew that you deserved more support."',
    ),
    _StepData(
      number: '3',
      title: 'Apologize',
      body:
      'Now say it - directly and genuinely, and from a grounded place that holds both truths: you are a good person who did your best, and you are genuinely sorry for the impact on your child. '
          'Let your child feel both your sorrow and your steadiness. Something as simple as: "I am so sorry for the pain that caused you." '
          'Cultural note: In some families or cultural traditions, a parent saying "I\'m sorry" to a child directly doesn\'t feel right or natural. '
          'If that\'s true for you, you can simply skip this step and move on to the next. '
          'Your efforts can come through your tone, your acknowledgment, your effort. There is no need to violate your family\u2019s cultural norms. '
          'What matters is that your child experiences your genuine sorrow - the exact words are secondary.',
      example:
      '"I want you to know that I am so sorry for the pain this caused you."',
    ),
    _StepData(
      number: '4',
      title: 'Name What They Needed, and What You\'ll Do Differently',
      body:
      'This is one of the most healing parts of the entire apology. Tell your child - as clearly and honestly as you can - what you now understand they needed. Even if you couldn\'t have provided it at the time, naming it out has a powerful effect. It says: I see now.'
          ' I get it. Then make a real, concrete statement about what you will do differently going forward: in how you show up, how you respond, how you handle the things that went wrong before. It can be really small but it has to be do-able.',
      example:
      '"I see now that, whatever was going on, you needed me to slow down and really listen. I needed to just be with you in whatever you were feeling. Going forward, I want to work on doing that. When something\'s hard for you, I want to be the kind of parent you can come to."',
    ),
    _StepData(
      number: '5',
      title:
      'Prepare for Their Reaction, validate their reaction and repeat Steps 3 and 4',
      body:
      'Your child might respond in any number of ways. They might push back. They might go very quiet. They might say "it\'s fine" or try to reassure you that everything\'s okay. They might cry. They might leave the room. '
          'All of these reactions are valid, and all of them are normal. Whatever comes up, your job is to first validate their reaction. For example:',
      reactionExamples: [
        _ReactionExample(
          label: 'If anger or silence, try saying:',
          quote:
          '"I can understand why you would be angry. It probably feels like too little too late... you\u2019ve tried to get my attention on this issue many times..."',
        ),
        _ReactionExample(
          label: 'If reassurance, try saying:',
          quote:
          '"I can understand why you would want to reassure me. You\u2019ve seen me hurting in the past and that\u2019s been really hard..."',
        ),
        _ReactionExample(
          label: 'If denial, try saying:',
          quote:
          '"I can understand why you wouldn\u2019t remember this. It\u2019s a hard truth in our family..."',
        ),
        _ReactionExample(
          label: 'If pain or grief, try saying:',
          quote:
          '"I can understand why you\u2019d feel pain. It\u2019s an old wound that hasn\u2019t received the attention it deserves..."',
        ),
      ],
      bodyAfterExamples:
      'Then, repeat steps 3 and 4 by restating the apology and the commitment, calmly and steadily. Why the second pass? The first time you delivered the apology, your child may have been bracing, not quite able to take it in, or not quite trusting what was happening. Once their reaction to your apology has been expressed and you\u2019ve validated the experience as normal, their walls can come down (at least somewhat), and therefore the words from Steps 3 and 4 are more likely to reach them, and more deeply, the second time around.',
      example: '',
    ),
    _StepData(
      number: '+1',
      title: 'Two optional add-ons',
      body:
      'Once you\'ve been through the five steps, there are two things you can offer; neither is required, but either can be valuable depending on your situation and your child\'s needs.',
      reactionExamples: [
        _ReactionExample(
          label: 'An invitation to share \n try saying:',
          quote:
          '"Your experience matters to me, and I\'m here to listen if you want to tell me more about what it was like for you. '
              'It could be now, two weeks from now, or a year from now. Whenever you\'re ready, I want to hear it. '
              'I want to be here for you in a different way."',
          footer:
          'Not every child will want to talk immediately. Some will need time to process what they\'ve heard before they can respond. '
              'This invitation tells them the door is open and on their timeline.',
        ),
        _ReactionExample(
          label: 'Offer to explain \n try saying:',
          intro:
          'If you feel a strong pull to help your child understand why things happened the way they did, the pressures you were under, what you were dealing with at the time, you can offer that. But offer it as a gift, and only offer it if you can genuinely accept a "no":',
          quote:
          '"If you\'d find it helpful to hear a little more about why things happened the way they did, I\'m happy to share that. But not everyone wants that, and it\'s completely okay if you don\'t. Either way, it doesn\'t change that what happened wasn\'t what you needed, and I see that now."',
          footer:
          'Some kids will want to hear that your intentions were good, or at least not bad, as it can provide them with a sense of comfort. Other kids will want to focus solely on the impact, and any focus on intention can actually feel bad. Both are normal and valid experiences, so it\u2019s important to be flexible and responsive to what might feel best for your child.',
        ),
      ],
      example: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text('Therapeutic Apology', style: AppTextStyles.heading),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'For parents & caregivers',
                style: AppTextStyles.label.copyWith(
                  fontSize: 11,
                  letterSpacing: 0.6,
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Page title
            Text(
              'Guide to therapeutic apology',
              style: textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Sometimes a moment calls for more than validation and support, it calls for repair. The Therapeutic Apology is an advanced validation and support technique from EFFT that builds on the foundational skills you\'ve already been practicing. It goes a step further, offering a structured way to heal ruptures, strengthen your relationship, and deepen the trust between you and your child. If you\'ve been working through the Validation & Support framework and feel ready to go deeper, this is for you.',
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'What follows is a guide to one of the more '
                  'meaningful things a parent or caregiver can offer a child: a structured, intentional apology to release old pain. '
                  'This content will walk you through what a therapeutic apology is, why it works, how to prepare, and how to deliver it in a way that is most likely to lead '
                  'to positive outcomes for you, your child, and your family as a whole.',
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),

            // Info cards
            _InfoCard(
              title: 'What is a therapeutic apology?',
              body: '''
Most of us grew up with a fairly simple idea of what an apology is: you did something wrong, you say you're sorry, and you move on. Some of us learned that apologizing was risky - that admitting fault meant getting in trouble. Others learned it was a one-and-done moment, something to say to end a fight for example.

A therapeutic apology works differently. It isn't about resolving a conflict or ending an uncomfortable moment. It's about something helping your child resolve old pain so that they don't need to carry it forward - into their relationship with you, or into their relationships with others. They also learn valuable skills relating to emotion processing and relationship repair.

At its heart, a therapeutic apology is a form of deep validation. It says: I see what happened. I understand how it affected you. I'm truly sorry. And I want to do things differently. It brings together three necessary ingredients for maximum effectiveness:

\u2022 Emotional tone: Real sorrow or soreness about what happened or what was missing
\u2022 Cognitive tone: A genuine understanding that your child needed something different from what they got, even if it wasn\u2019t possible in that moment
\u2022 Behavioral tone: A commitment to building a bridge somewhere new together, in light of the teachings from what happened in the past

One important thing to know up front: a therapeutic apology is not about resolving a conflict, assigning blame, or reaching an agreement. It's a one-way gift to your child. You're offering them something that will help them to settle or let go of an old hurt. In other words, you're not looking for a specific response or asking them to meet you halfway.

A moment to reflect: Before reading on, it can help to notice your own relationship with apologizing. What did it mean in the family you grew up in? Did it feel risky? Forced? Did you ever see a parent genuinely apologize to a child? Those early messages can shape how we approach this - and being aware of them is a good place to start.
''',
            ),
            const SizedBox(height: 12),

            _InfoCard(
              title: "Why it's worth it",
              body: '''
Parents often wonder whether bringing up old wounds is really a good idea. Won't it just stir things up? Won't my child feel worse, or use it against me? These are understandable questions. But the research and clinical experience behind this approach is optimistic: when done well, a therapeutic apology can be very healing for all involved.

Here is what a therapeutic apology can do:

\u2022 Heal old wounds. Children - even children who seem fine - can carry pain from experiences that weren't fully acknowledged. A therapeutic apology gives that pain a place to transform.
\u2022 Strengthen your relationship. When your child sees that you can hold what happened and take responsibility for it, something shifts between you. Trust deepens and the relationship becomes safer.
\u2022 Relieve your child's burden. Some children carry both hurt but self-blame \u2013 including an immature belief that what happened was somehow their fault. A therapeutic apology can help to lift that burden.
\u2022 Release resentment. Unacknowledged pain often turns into anger, withdrawal, or acting out. When the wound is named and validated, there is often less need for those reactions.
\u2022 Open the door to understanding, letting go, compassion, etc - for all involved.
\u2022 Change the emotional culture of your family. When a parent can say I see now that I got that wrong and I'm sorry, it signals to your child that hard feelings can be named, that repair is possible, and that relationships can survive challenges. It can also make your child more open to receiving your care and support going forward. Over time, this kind of repair can support an evolution of the emotional culture of your family as a whole.


It's also worth noting that a therapeutic apology is not a loss of authority. It is, in fact, one of the most powerful uses of your authority as a parent - choosing to lead a process in service of your child's healthy development and wellbeing, including your relationship.
''',
            ),
            const SizedBox(height: 12),

            _InfoCard(
              title: 'Before You Begin',
              body: '''
This approach was developed within Emotion-Focused Family Therapy (EFFT), and it is advised that this content be explored with the guidance of a therapist trained in this model. An EFFT therapist can help you assess your readiness, work through any self-blame or blocks that might get in the way of optimal delivery, and personalize your apology to your specific situation. They can also support you through what can be a meaningful and emotionally complex experience. This app was meant to serve as a resource alongside that professional support.

Understanding Where You Come From

A therapeutic apology can work best when you've done a little preparation so that it comes from a grounded, clear place. It doesn\u2019t mean you won\u2019t get emotional \u2013 that is totally ok. We all parent from within a larger story - one that includes how we were raised, the cultural or religious values we grew up with, and the broader world that shaped our family. A parent who grew up in a household where emotions were rarely named will bring that with them. A caregiver whose community taught that children should be seen but not heard will carry that too. Becoming aware of those layers - what your community did well, what they missed, what messages you absorbed about how parents and children are supposed to relate - can help you to evolve how you decide to show up for your child now.

You don't need to have worked through all of it before you apologize. You just need enough awareness to hold your child's experience without collapsing, reacting with defensiveness or falling into shame or self-blame.

The Self-Blame Check

Before delivering a therapeutic apology, it helps to check in with how you're feeling about what happened.

Here's what needs to be true: you need to be able to hold two things at once.

1. You did the best you could. You were a real person, in real circumstances, with real human limits and your own history.
2. Some of what you did - or didn't do - hurt your child. That impact is real, regardless of your intentions.

Both of these are true at the same time. Holding them together is what allows you to deliver this kind of apology from a grounded place rather than from guilt, collapse or defensiveness.

A simple way to check: on a scale of 1 to 10, how intensely are you blaming yourself right now? If you're in the 1 to 6 range, you're likely in a workable place. Recommend to proceed.

If you find yourself closer to 7 or above, the self-blame itself may need some attention first. When self-blame is very high, it becomes hard to keep the apology focused on your child - it can tip into expressing your own distress, which unintentionally puts your child in the position of managing your feelings. If this is where you are, slow down and ask for help to work through that layer first with the support of your therapist.
''',
            ),
            const SizedBox(height: 12),

            _InfoCard(
              title: 'Finding Your Focus',
              body: '''
A therapeutic apology lands best when it's specific. A broad, general apology can feel too vague, even when it's sincere. Here are a few questions to help you find your focus:

What does your gut tell you? Trust yourself here. You know your child - you've watched them grow, and you've likely had a sense, even if you've pushed it away, of where they've been hurt.

Where do you sense your child carries the most? Where do you notice the most anger, the most distance, the most resentment - or the most self-blame or blame towards you? Sometimes children carry things quietly, in ways that show up as withdrawal or self-criticism rather than direct expressions of hurt.

What keeps coming up? In arguments, in your child's behavior, in the things they say, even if indirectly?

You don't need to address everything at once. A therapeutic apology focused on one real wound is far more powerful than a sweeping attempt to try to cover everything (which is simply not possible).
''',
            ),
            const SizedBox(height: 24),

            // Section: A Few Things to Keep in Mind
            Text(
              'A Few Things to Keep in Mind',
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            _InfoCard(
              title: 'Timing matters.',
              body:
              'A therapeutic apology lands best when both you and your child are in a reasonably open and settled state. Choose your moment with some care. It doesn\'t have to be perfect, but it should be intentional.',
            ),
            const SizedBox(height: 12),
            _InfoCard(
              title: 'Make it yours.',
              body:
              'The structure in this app is a guide you - with the support of a therapist \u2013 to craft something that is meaningful to you and for your child. Your child will respond best to something that sounds like you - warm, honest, specific to your relationship - even if you end up reading it or sending it by email or text. Use the framework to ensure all steps are included, and then let it come through in your own voice.',
            ),
            const SizedBox(height: 12),
            _InfoCard(
              title: 'Expect it to be a process.',
              body:
              'Deeper wounds don\'t always heal in one conversation, and that\'s okay. Your child may need time before they soften, before they believe what they\'re hearing, before they feel safe enough to respond. A single therapeutic apology can be a powerful beginning - but it may need to be revisited as your relationship continues to grow. Think of this as a commitment, or a new beginning.',
            ),
            const SizedBox(height: 12),
            _InfoCard(
              title: 'Manage your expectations around their response.',
              body:
              'Your job is to deliver the apology clearly, genuinely, and without conditions, in whatever medium you feel they will respond to best (in person face-to-face, in person side-by-side, by text, over the phone, by email or in a letter). What your child does with it - and how quickly - is their own process. Some children respond right away. Others need days or weeks. Either is completely normal. The goal is the offering, and the impact it can have over time.',
            ),
            const SizedBox(height: 32),
            const Divider(color: AppColors.divider),
            const SizedBox(height: 24),

            // Steps section
            Text(
              'The 5 + 1 steps',
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: 6),
            Text(
              'With the support of your EFFT therapist, the script builder that follows will walk you through each step, one at a time.',
              style: textTheme.bodyLarge?.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Each step has a specific purpose. Click on a step to learn about it.',
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),

            // Step tab row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(_steps.length, (i) {
                  final active = i == _selectedStep;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedStep = i),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: active
                            ? AppColors.primary
                            : AppColors.surfaceVariant,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: active
                              ? AppColors.primary
                              : AppColors.cardBorder,
                        ),
                      ),
                      child: Text(
                        i == _steps.length - 1
                            ? 'Step 6 (optional)'
                            : 'Step ${i + 1}',
                        style: AppTextStyles.body.copyWith(
                          fontWeight: FontWeight.w600,
                          color: active ? Colors.white : AppColors.textSecondary,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 12),

            // Step panel
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 180),
              child: _StepPanel(
                key: ValueKey(_selectedStep),
                data: _steps[_selectedStep],
              ),
            ),

            const SizedBox(height: 24),

            // Complete worked example
            _ExampleCard(
              title: 'Therapeutic Apology – A Complete Example',
              body: '''
Here is what a finished therapeutic apology looks like, following all five (+1) steps.

Step 1 – Acknowledge the Injury / Pattern
"I want to talk to you about something I've been thinking about – the way that, when you were upset or going through something hard, I would sometimes jump in too quickly to reassure you or try to fix it, rather than just being with you in it. And how hard that must have been for you. Especially because you're someone who feels things deeply."

Step 2 – Validate the Emotions
"I can imagine that when you'd come to me with something hard and I'd jump straight to 'it'll be okay' or 'here's what you should do,' you might have felt scared to keep sharing – like maybe your feelings were too much, or like I wasn't quite able to go there with you.
I can also imagine you felt sad sometimes, because you really wanted connection in those moments, and you may have ended up feeling a little more alone instead.
It would have made sense if you felt embarrassed too – like something was off about the way you were feeling, or that you were just too sensitive.
And I can imagine you might have felt some anger underneath it all – because you deserved someone who could be with you in it."

Step 3 – Apologize
"I want you to know that I am so sorry for the pain this caused you."

Step 4 – Name What They Needed and What Will Change
"I can see now that what you needed was for me to slow down and just be with you – not fix it, not make it better, just really listen and let you feel what you were feeling. Starting today, when you come to me with something hard, I'm going to work on staying there with you. I'm going to keep learning new skills, and I'm going to try to ask what you need rather than assume I know. It won't always go perfectly, but I won't stop working on this."

Step 5 – Validate Their Reaction, Then Repeat Steps 3 & 4
If they say nothing in response: "I can understand this might be a lot to take in. You've spent a long time figuring out how to handle things on your own, and it makes sense that it would take time to trust that something is different now."
Then: "And I want you to know – I am genuinely so sorry. I see now that what you might have needed was for me to slow down and just be with you, and that's what I want to work on. Starting today, I'm going to try to listen and validate first, before I fix or reassure. It won't always go perfectly, but I am committed to being there for you in a better way."

Step 6 – Optional Add-Ons
Invitation to share: "Your experience matters to me, and I'm here to listen to anything you have to say about this, whenever you're ready. It could be now, two weeks from now, or a year from now. You matter to me more than words can say."
Permission to explain: "If it would help to hear a little more about why things happened the way they did, I'm happy to share that. But not everyone wants that – and it's completely okay if you don't. Either way, it doesn't change that it wasn't what you needed, and I see that now."
''',
            ),

            const SizedBox(height: 32),
            const Divider(color: AppColors.divider),
            const SizedBox(height: 24),

            // CTA section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.07),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.2),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'You\'re ready',
                    style: AppTextStyles.label.copyWith(
                      letterSpacing: 0.5,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Walk through each step one at a time and choose phrases that feel true to you. Your script will be ready to copy or read aloud.',
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ApologyScriptBuilderScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.edit_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                      label: const Text('Build your personal therapeutic apology script.'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Data model

class _ReactionExample {
  final String label;
  final String quote;
  final String? intro;
  final String? footer;

  const _ReactionExample({
    required this.label,
    required this.quote,
    this.intro,
    this.footer,
  });
}

class _StepData {
  final String number;
  final String title;
  final String body;
  final String example;
  final String exampleLabel;
  final List<_ReactionExample>? reactionExamples;
  final String? bodyAfterExamples;

  const _StepData({
    required this.number,
    required this.title,
    required this.body,
    required this.example,
    this.exampleLabel = 'Example:',
    this.reactionExamples,
    this.bodyAfterExamples,
  });
}

// Reusable widgets

class _InfoCard extends StatelessWidget {
  final String title;
  final String body;

  const _InfoCard({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(body, style: textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

class _ExampleCard extends StatelessWidget {
  final String title;
  final String body;

  const _ExampleCard({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final lines = body.trim().split('\n');

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: textTheme.titleMedium),
            const SizedBox(height: 10),
            ...lines.map((line) {
              final isStepHeader = line.trimLeft().startsWith('Step ');
              return Padding(
                padding: EdgeInsets.only(top: isStepHeader ? 14 : 2),
                child: Text(
                  line,
                  style: isStepHeader
                      ? textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  )
                      : textTheme.bodyMedium,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _StepPanel extends StatelessWidget {
  final _StepData data;

  const _StepPanel({super.key, required this.data});

  Widget _buildExampleBox(
      BuildContext context,
      String label,
      String quote, {
        String? intro,
        String? footer,
      }) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.validationCard,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (intro != null) ...[
            Text(intro, style: textTheme.bodyMedium),
            const SizedBox(height: 10),
          ],
          Text(
            label,
            style: AppTextStyles.label.copyWith(
              fontSize: 13,
              letterSpacing: 0.5,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            quote,
            style: textTheme.bodyMedium?.copyWith(
              fontStyle: FontStyle.italic,
            ),
          ),
          if (footer != null) ...[
            const SizedBox(height: 10),
            Text(footer, style: textTheme.bodyMedium),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final hasReactionExamples =
        data.reactionExamples != null && data.reactionExamples!.isNotEmpty;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Step number circle
            Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                data.number,
                style: AppTextStyles.body.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(data.title, style: textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(data.body, style: textTheme.bodyMedium),

            if (hasReactionExamples)
              ...data.reactionExamples!.map(
                    (reaction) => _buildExampleBox(
                  context,
                  reaction.label,
                  reaction.quote,
                  intro: reaction.intro,
                  footer: reaction.footer,
                ),
              ),

            if (data.bodyAfterExamples != null) ...[
              const SizedBox(height: 14),
              Text(data.bodyAfterExamples!, style: textTheme.bodyMedium),
            ],

            if (!hasReactionExamples && data.example.isNotEmpty)
              _buildExampleBox(context, data.exampleLabel, data.example),
          ],
        ),
      ),
    );
  }
}
