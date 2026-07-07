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

  // Filter categories map exactly to the 5 primary framework emotions
  final List<String> _categories = [
    'All',
    'Anger',
    'Shame',
    'Hopelessness',
    'Sadness',
    'Anxiety',
  ];

  // Full production script collection sourced from EC_Scripts_Youth_Ages_8-12.revised.docx
  final List<Map<String, String>> _scripts = [
  // --- ANGER ---
  {
  'title': 'Feeling misunderstood',
  'category': 'Anger',
  'situation': 'When a child feels like no one is listening to their side of things.',
  'script': 'VALIDATION (Choose 3):\n'
  '• I can imagine why you\'d feel angry right now because it might feel like no one stopped to really hear your side of things.\n'
  '• ...because you had something important to say and it might feel like it wasn\'t taken seriously.\n'
  '• ...because you were counting on things going differently and they didn\'t.\n'
  '• ...because it might feel like you\'re the only one who sees it this way.\n'
  '• ...because being misunderstood, especially by someone you care about, really hurts.\n\n'
  'EMOTIONAL SUPPORT (Choose 2):\n'
  '• Your voice matters to me.\n'
  '• I really do want to understand what happened from your point of view.\n'
  '• We are in this together.\n'
  '• I\'m glad you told me.\n'
  '• I know you’re doing the best you can right now.\n\n'
  'PRACTICAL SUPPORT (Choose 1-2):\n'
  '• How about we take a short break and then sit down so I can really listen, without any distractions?\n'
  '• Can you walk me through exactly what happened, from the beginning? I want to get the whole picture.\n'
  '• Let\'s find a quiet spot where just the two of us can talk it out properly.\n'
  '• Let’s figure out a plan to prevent this from happening again. What if __________?',
},
{
'title': 'Feeling powerless',
'category': 'Anger',
'situation': 'When a child feels out of control or like nothing they do changes things.',
'script': 'VALIDATION (Choose 3):\n'
'• No wonder you\'re angry because so much of this feels out of your control right now.\n'
'• ...because you\'ve been trying so hard with so little actually changing.\n'
'• ...because it can feel really unfair when things won\'t budge no matter what you do.\n'
'• ...because you want things to be different and you don\'t know how to make that happen.\n'
'• ...because having no say in something that matters to you is really frustrating.\n\n'
'EMOTIONAL SUPPORT (Choose 2):\n'
'• I see how hard you\'ve been trying, and I want you to know that.\n'
'• I believe you can get through this, and I\'m going to help.\n'
'• You don\'t have to figure this out alone.\n'
'• I\'m proud of you for keeping at it even when it\'s been this hard.\n'
'• Your feelings make total sense to me.\n\n'
'PRACTICAL SUPPORT (Choose 2):\n'
'• Let\'s find one small thing we can actually change together - just one thing to start.\n'
'• What part of this feels most out of control? Let\'s start there.\n'
'• How about we take a break from the big stuff and do something fun for a bit, and then come back to it?',
},
{
'title': 'A boundary was crossed',
'category': 'Anger',
'situation': 'When a child feels unrespected, mistreated, or like boundaries were ignored.',
'script': 'VALIDATION (Choose 3):\n'
'• I could understand why you\'d feel really angry because something that really matters to you wasn\'t respected.\n'
'• ...because you expected to be treated differently than that.\n'
'• ...because it might feel like no one is taking your side right now.\n'
'• ...because when someone crosses a line, it can feel both upsetting and scary at the same time.\n'
'• ...because it\'s not okay for someone to treat you that way, and part of you knows that.\n\n'
'EMOTIONAL SUPPORT (Choose 2):\n'
'• Your feelings make complete sense to me.\n'
'• I want to make space for what happened and help you feel safe.\n'
'• I\'m glad you told me - you were right to.\n'
'• You deserve to be treated with respect, and I am on your side.\n'
'• I\'m here, and I\'m not going to brush this off.\n\n'
'PRACTICAL SUPPORT (Choose 2):\n'
'• Can you tell me more about exactly what happened so I can really understand?\n'
'• Let\'s talk about what you need right now to feel safe and okay.\n'
'• Together let\'s figure out what we want to do about this - you don\'t have to decide alone.',
},
{
'title': 'Feeling overwhelmed',
'category': 'Anger',
'situation': 'When everything piles up at once and causes an angry outburst.',
'script': 'VALIDATION (Choose 3):\n'
'• No wonder you\'re feeling overwhelmed because everything has piled up at once and it is a lot to carry.\n'
'• ...because you haven\'t had a moment to breathe and just be yourself.\n'
'• ...because when too many things happen at once, anger can show up to say "this is too much".\n'
'• ...because you might feel stuck with no way out right now.\n'
'• ...because you\'ve been dealing with a lot more than most people realize.\n\n'
'EMOTIONAL SUPPORT (Choose 2):\n'
'• I\'m right here with you.\n'
'• It\'s completely okay to feel this way.\n'
'• You don\'t have to hold all of this by yourself.\n'
'• I see how much you\'ve been dealing with, and I think you\'ve been really brave.\n'
'• We can figure this out together, one thing at a time.\n\n'
'PRACTICAL SUPPORT (Choose 2):\n'
'• How about we step outside or take a few minutes away from everything to reset?\n'
'• Let\'s figure out together what the most pressing thing is and start just there - one thing.\n'
'• Is there something we can take off your plate right now, even just for today?',
},
{
'title': 'Old hurts coming up',
'category': 'Anger',
'situation': 'When a current event triggers emotional or painful memories from the past.',
'script': 'VALIDATION (Choose 3):\n'
'• It makes sense that you\'d react right now because this situation brings up something hard that happened before.\n'
'• ...because when something hurt you in the past, it can come rushing back in moments like this.\n'
'• ...because your body and brain remember painful things, even when you\'d rather they didn't.\n'
'• ...because upset feelings can sometimes be a way of saying "I don\'t want this to happen again".\n'
'• ...because you\'ve been through some hard things, and that leaves a mark - and that is not your fault.\n\n'
'EMOTIONAL SUPPORT (Choose 2):\n'
'• I\'m here with you in this - not on the other side of it.\n'
'• You don\'t have to carry this by yourself.\n'
'• What you\'re feeling makes total sense, even if it\'s hard to explain.\n'
'• I\'m not scared of what you\'re feeling and I\'m not going anywhere.\n'
'• You are safe with me.\n\n'
'PRACTICAL SUPPORT (Choose 2):\n'
'• We can go as slowly as you need - there\'s no rush here.\n'
'• Let\'s take a break and then come back to it when your body feels a little calmer.\n'
'• Is there something that would help you feel a bit safer right now?',
},
{
'title': 'Angry at themselves',
'category': 'Anger',
'situation': 'When perfectionism triggers irritation or frustration with personal mistakes.',
'script': 'VALIDATION (Choose 3):\n'
'• I can understand why you\'d feel angry right now because you care so much about doing things well and this didn\'t go the way you wanted.\n'
'• ...because it\'s really frustrating when you know you can do better.\n'
'• ...because maybe you feel like you let yourself or someone else down.\n'
'• ...because being hard on yourself can sometimes feel like the right thing to do when things go wrong.\n'
'• ...because you hold yourself to high standards and it stings when you don\'t meet them.\n\n'
'EMOTIONAL SUPPORT (Choose 2):\n'
'• Everyone makes mistakes - it doesn\'t change how I see you.\n'
'• I\'m really proud of how much you care.\n'
'• Being kind to yourself is just as important as doing your best, and I want to help you with that.\n'
'• You are so much more than this one moment.\n'
'• I love you no matter what.\n\n'
'PRACTICAL SUPPORT (Choose 2):\n'
'• Let\'s talk about what happened so we can learn from it together - not to blame you, but to help.\n'
'• What would you say to a good friend who made the same mistake? Let\'s try saying that to yourself.\n'
'• Is there something you could do to help make it right, even just a little bit?',
},

// --- SHAME ---
    {
'title': 'When they feel like they messed up',
'category': 'Shame',
'situation': 'When a child fails an objective or makes a noticeable mistake.',
'script': 'VALIDATION (Choose 3):\n'
'• I can understand why you\'d feel ashamed right now because you really cared about doing this well and it didn\'t go the way you hoped.\n'
'• ...because it didn\'t turn out the way you worked so hard for.\n'
'• ...because you might be worried about what I think of you right now.\n'
'• ...because when we care about something and it goes wrong, it can feel like it says something about who we are - even when it doesn\'t.\n'
'• ...because it\'s hard not to feel bad when you know you could have done things differently.\n\n'
'EMOTIONAL SUPPORT (Choose 2):\n'
'• You are still good, still loved, and still completely worthy - nothing about this changes that.\n'
'• One mistake doesn\'t define who you are.\n'
'• The fact that you feel bad about this tells me how much you care - and that matters.\n'
'• I love you the same as I always have, and I always will.\n'
'• Everyone makes mistakes - you are very much not alone in this.\n\n'
'PRACTICAL SUPPORT (Choose 2):\n'
'• Let\'s look at what happened together - not to make you feel worse, but to figure out the next step side by side.\n'
'• Is there anything you\'d like to do to make things right? I\'ll help you.\n'
'• How about we take a breath, and then we\'ll come up with a plan together?',
},
{
'title': 'When they feel like they disappointed you',
'category': 'Shame',
'situation': 'When a child worries that they have lost your approval or pride.',
'script': 'VALIDATION (Choose 3):\n'
'• It makes sense you\'d feel upset because you care deeply about our relationship and you didn\'t want to let me down.\n'
'• ...because you were hoping I\'d be proud, and you\'re not sure right now if I am.\n'
'• ...because when we love someone, we want them to feel good about us - and right now you\'re not sure I do.\n'
'• ...because it can be really scary to imagine that someone important to you is disappointed.\n'
'• ...because you hold yourself to a high standard when it comes to the people you love.\n\n'
'EMOTIONAL SUPPORT (Choose 2):\n'
'• I still see your goodness, clearly and completely.\n'
'• This one moment doesn\'t change what I think of you.\n'
'• You are not a disappointment to me - not even close.\n'
'• I love you, and that\'s not something you can accidentally undo.\n'
'• I\'m proud of who you are, even in hard moments like this one.\n\n'
'PRACTICAL SUPPORT (Choose 2):\n'
'• Let\'s talk through it gently, at your pace - whenever you\'re ready.\n'
'• Is there something that would help you feel a bit better right now?\n'
'• Once you\'re ready, we can figure out together what comes next.',
},
{
'title': 'When they\'re stuck in self-blame',
'category': 'Shame',
'situation': 'When a child turns all the fault inwards regarding a complex issue.',
'script': 'VALIDATION (Choose 3):\n'
'• I can understand why you\'d feel so ashamed because you\'ve been carrying this by yourself for a while now, and it feels really heavy.\n'
'• ...because it\'s really hard when your brain keeps telling you that this is all your fault.\n'
'• ...because you were doing the best you could in a hard moment - even if it doesn\'t feel that way right now.\n'
'• ...because blaming yourself can feel like the right thing to do when something goes wrong.\n'
'• ...because you care so much about doing the right thing, and it hurts when you feel like you didn\'t.\n\n'
'EMOTIONAL SUPPORT (Choose 2):\n'
'• You deserve to be gentle with yourself - not to attack yourself.\n'
'• I\'m right here with you, and I\'m not judging you.\n'
'• What happened was complicated, and you are not the whole story.\n'
'• I see you trying, and trying counts - a lot.\n'
'• You are worthy of kindness, especially from yourself.\n\n'
'PRACTICAL SUPPORT (Choose 2):\n'
'• Let\'s look at the whole picture together - not just the part you\'re blaming yourself for.\n'
'• Can we think about this together the way you\'d think about it if it happened to a friend?\n'
'• Is there something small you could do today that might feel like a step in the right direction?',
},
{
'title': 'When they withdraw or shut down',
'category': 'Shame',
'situation': 'When a child goes quiet or pulls back as a defense mechanism.',
'script': 'VALIDATION (Choose 3):\n'
'• I can see why you\'d want to pull away right now because you might be worried about being misunderstood or judged.\n'
'• ...because the feelings inside might feel hard and it might feel safer to go quiet.\n'
'• ...because you might not even have the words yet for what you\'re feeling.\n'
'• ...because sometimes pulling back feels like the only way to stay okay.\n'
'• ...because we haven’t always been in the habit of talking about the tough stuff.\n'
'• ...because there have been times when I’ve definitely said or done the wrong thing.\n\n'
'EMOTIONAL SUPPORT (Choose 2):\n'
'• You don\'t have to hide from me - I\'m here to meet you with care, not judgment.\n'
'• There\'s no pressure. I\'ll be here whenever you\'re ready.\n'
'• Your silence doesn’t scare me or make me mad. It makes sense.\n'
'• You can take your time. I\'m not going anywhere.\n'
'• Even your silence is okay with me. I\'m right here.\n'
'• You matter to me, whether or not you can talk right now.\n\n'
'PRACTICAL SUPPORT (Choose 2):\n'
'• We can talk a little now or come back to it later - whatever helps you feel safest.\n'
'• Is there something that might make it feel even a tiny bit easier to open up?\n'
'• Would it help to do something together first, before we try to talk about it?',
},
{
'title': 'When they feel stupid',
'category': 'Shame',
'situation': 'When learning difficulties or failures sting their sense of capability.',
'script': 'VALIDATION (Choose 3):\n'
'• I can imagine you\'d feel embarrassed right now because this really mattered to you and you wanted to do it well.\n'
'• ...because maybe you think other kids would have handled it differently or more easily.\n'
'• ...because you care about being capable and good at things, and right now it doesn\'t feel that way.\n'
'• ...because it can really sting when your brain tells you you\'re not smart enough or good enough.\n'
'• ...because school or learning has been hard lately, and that\'s really frustrating and discouraging.\n\n'
'EMOTIONAL SUPPORT (Choose 2):\n'
'• You are learning, growing, and trying - and that\'s what actually matters.\n'
'• Your worth is not tied to how well you do on any one thing.\n'
'• Everyone struggles with some things - it\'s part of being human.\n'
'• I think you\'re smart in so many important ways.\n'
'• I\'m proud of you for trying, even when it\'s hard.\n\n'
'PRACTICAL SUPPORT (Choose 2):\n'
'• Let\'s break this down together and figure out where the hard part is - I\'ll help.\n'
'• Maybe we can come up with a different approach that works better for how your brain works.\n'
'• Is there a way I can support you with this that we haven\'t tried yet?',
},

// --- HOPELESSNESS ---
    {
'title': '"Nothing will ever change"',
'category': 'Hopelessness',
'situation': 'When a child is exhausted from an issue and loses faith in positive shifts.',
'script': 'VALIDATION (Choose 3):\n'
'• I can understand why you feel hopeless right now because you\'ve been trying for such a long time with not enough relief.\n'
'• ...because you\'re exhausted from carrying this, inside and out.\n'
'• ...because it might feel like you\'re doing this all by yourself and no one really gets it.\n'
'• ...because when you try and try and nothing changes, it\'s hard to keep believing it will.\n'
'• ...because it might be hard to even imagine what "better" would look like right now.\n\n'
'EMOTIONAL SUPPORT (Choose 2):\n'
'• You don\'t have to face this by yourself - I\'m right here and I\'m not going anywhere.\n'
'• I can see how tired you are, and you don\'t have to keep carrying this alone.\n'
'• I don\'t know exactly when or how things will shift, but I believe they can - and I\'ll hold that hope for you until you can hold it yourself.\n'
'• You are trying so hard, and that means something, even when it doesn\'t feel like it.\n'
'• I am in this with you, all the way.\n\n'
'PRACTICAL SUPPORT (Choose 2):\n'
'• Let\'s choose one tiny thing we can do together today - something so small it feels actually doable.\n'
'• How about we take a break from the heavy stuff and just be together for a bit?\n'
'• Let\'s think about just the next hour, not the big picture - what would help right now, in this moment?',
},
{
'title': '"Nothing I do matters"',
'category': 'Hopelessness',
'situation': 'When effort doesn\'t produce expected returns and leads to fatigue.',
'script': 'VALIDATION (Choose 3):\n'
'• I understand why you\'d feel hopeless because you\'ve been putting in so much effort and it doesn\'t seem to be paying off.\n'
'• ...because the impact of what you\'re doing hasn\'t matched how hard you\'ve been trying.\n'
'• ...because it can feel like there\'s no point in even trying when nothing seems to help.\n'
'• ...because you\'ve given so much of yourself and you might feel like it\'s been for nothing.\n'
'• ...because that feeling of "what\'s the point?" is incredibly painful and exhausting to live with.\n\n'
'EMOTIONAL SUPPORT (Choose 2):\n'
'• Your efforts matter - to me, and far more than you can see right now.\n'
'• I notice how hard you try, even when it\'s hard, and I am proud of you.\n'
'• What you do and who you are matters deeply, even in moments when it doesn\'t feel that way.\n'
'• I believe in you, even when you don\'t believe in yourself right now.\n'
'• You are making a difference, even if you can\'t see it yet.\n\n'
'PRACTICAL SUPPORT (Choose 2):\n'
'• Let\'s take a moment and name even one small thing that came from your efforts - however tiny.\n'
'• What if we tried something just a little different, together, and see what happens?\n'
'• Can we just take a break right now - not give up, just pause - and give your system a rest?',
},
{
'title': 'Feeling like a burden',
'category': 'Hopelessness',
'situation': 'When a child worries that their struggles weigh too heavily on the family.',
'script': 'VALIDATION (Choose 3):\n'
'• It makes sense you feel hopeless because you\'re worried that your struggles are too much for the people around you.\n'
'• ...because you care about the people you love and you don\'t want to weigh them down.\n'
'• ...because you might not be able to see right now all the ways that you matter and are valued.\n'
'• ...because carrying that worry - that you\'re a burden - on top of everything else is exhausting.\n'
'• ...because the thought of being "too much" for the people you love is one of the most painful things there is.\n\n'
'EMOTIONAL SUPPORT (Choose 2):\n'
'• You are not a burden to me. You are someone I love and want to support.\n'
'• Being here for you is something I want to do - not something I do despite the hard parts.\n'
'• I would rather know you\'re struggling than have you carry this alone.\n'
'• You matter so much to me - please don\'t forget that.\n'
'• Being here for you is not too much for me.\n\n'
'PRACTICAL SUPPORT (Choose 2):\n'
'• Let\'s talk about what kind of support feels okay for you - we can figure it out together.\n'
'• Is there one small way I can make things feel a little less heavy for you today?\n'
'• How about we do something that doesn\'t have to do with any of the hard stuff - just something that\'s for you?',
},

// --- SADNESS ---
    {
'title': 'Hurt by something that happened',
'category': 'Sadness',
'situation': 'When an unexpected painful outcome bruises a child\'s feelings.',
'script': 'VALIDATION (Choose 3):\n'
'• I can understand why you feel sad because what happened really hurt your heart.\n'
'• ...because you cared about this and it went in a direction you didn\'t expect.\n'
'• ...because it\'s hard to sit with that kind of pain, especially when you weren\'t expecting it.\n'
'• ...because the things that hurt us most are usually the things we care about most.\n'
'• ...because something that felt important to you got bruised, and that matters.\n\n'
'EMOTIONAL SUPPORT (Choose 2):\n'
'• I\'m right here. You don\'t have to carry this feeling alone.\n'
'• What you\'re feeling makes complete sense to me.\n'
'• I\'m so sorry this happened.\n'
'• Your heart matters to me, and I want to take care of it.\n'
'• I love you and I\'m not going anywhere.\n\n'
'PRACTICAL SUPPORT (Choose 2):\n'
'• Let\'s take a quiet moment together - maybe sit close - whatever feels comforting to you.\n'
'• Is there something that might help you feel a little better right now?\n'
'• Do you want to talk about it, or would it help more just to be together quietly for a while?',
},
{
'title': 'Grieving a change or loss',
'category': 'Sadness',
'situation': 'Adjusting to a new normal or coping with missing an old structure.',
'script': 'VALIDATION (Choose 3):\n'
'• It makes sense you\'re feeling sad because something important has shifted or gone, and that takes real time to adjust to.\n'
'• ...because you\'re missing what used to be, and that kind of missing is real.\n'
'• ...because loss - even when it seems small to others - can leave a real hole.\n'
'• ...because it takes time to move through something like this, and you don\'t have to rush.\n'
'• ...because you\'ve been having to adjust to a new normal that you didn\'t ask for.\n\n'
'EMOTIONAL SUPPORT (Choose 2):\n'
'• Your sadness is welcome with me. I\'m here for all of it.\n'
'• Grief takes as long as it takes, and I\'ll be here the whole way.\n'
'• You don\'t have to pretend you\'re okay when you\'re not.\n'
'• I love you and I\'m not going to rush you.\n'
'• Missing things that mattered is one of the most human feelings there is.\n\n'
'PRACTICAL SUPPORT (Choose 2):\n'
'• Would it help to talk about what you miss, or would you just like to be together for a while?\n'
'• Is there something comforting we could do together - something quiet or gentle?\n'
'• How about we find a small way to honor what\'s changed, so it doesn\'t feel like it\'s just disappearing?',
},

// --- ANXIETY ---
    {
'title': 'When anxiety spikes suddenly',
'category': 'Anxiety',
'situation': 'When a child triggers an intense nervous alert rapidly.',
'script': 'VALIDATION (Choose 3):\n'
'• I can understand why you feel anxious right now because something in that moment felt uncertain or unsafe, and your body reacted.\n'
'• ...because your nervous system picked up on something that felt like a threat, even if we can\'t name it.\n'
'• ...because part of you is trying really hard to keep you safe, and this is how it does that.\n'
'• ...because anxiety can come on fast, especially when you\'re already carrying a lot.\n'
'• ...because your body is doing its job - it might just be working a little too hard right now.\n\n'
'EMOTIONAL SUPPORT (Choose 2):\n'
'• I\'m right here - we can face this feeling together.\n'
'• You are safe right now, and I\'m not going anywhere.\n'
'• I\'m not going to tell you to calm down - let\'s just settle together, slowly.\n'
'• Your body is trying to help you. Let\'s help it relax a little.\n'
'• I\'ve got you.\n\n'
'PRACTICAL SUPPORT (Choose 2):\n'
'• Let\'s take a slow breath together and look around to see what\'s actually safe right now.\n'
'• Put your feet flat on the floor and tell me five things you can see - let\'s do that together.\n'
'• Can we move to a quieter spot and let your nervous system come down a little?',
},
{
'title': 'Dreading something upcoming',
'category': 'Anxiety',
'situation': 'When performance metrics or anticipation of the unknown causes stress.',
'script': 'VALIDATION (Choose 3):\n'
'• It makes sense you\'re anxious because this matters to you and you want it to go well.\n'
'• ...because the unknown can feel really big and overwhelming.\n'
'• ...because a wise part of you is trying to be prepared for what might happen.\n'
'• ...because when we care about something, our body sometimes tries to protect us from disappointment ahead of time.\n'
'• ...because you might have had hard experiences with things like this before, and your brain is remembering that.\n\n'
'EMOTIONAL SUPPORT (Choose 2):\n'
'• You don\'t have to figure this out alone - I\'ll walk with you through it.\n'
'• It makes complete sense that you\'re worried. This matters to you and that\'s not a bad thing.\n'
'• I believe in you, even when you don\'t believe in yourself right now.\n'
'• Whatever happens, I\'ll be right here.\n'
'• We\'ve gotten through hard things before, and we\'ll get through this one too.\n\n'
'PRACTICAL SUPPORT (Choose 2):\n'
'• Let\'s break this into one tiny step and see what would help that first step feel more manageable.\n'
'• Can we talk through what you\'re most worried about so we can see if there\'s anything we can prepare for?\n'
'• Is there something we can do today that would help you feel even a little more ready?',
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
        borderSide: BorderSide(color: _AppColors.cardBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: _AppColors.cardBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: _AppColors.primary, width: 1.5),
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
}