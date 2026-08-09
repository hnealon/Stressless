import '../models/script_library_example.dart';

/// Script Library - wording verbatim from the client document.
const String kScriptLibrarySourceDocument =
    'EC_Scripts_Youth_Ages_8-12.revised.docx';

const List<ScriptLibraryExample> scriptLibraryExamples = [
  // --- ANGER (6 Scenarios) ---
  ScriptLibraryExample(
    id: 'anger-feeling-misunderstood',
    emotion: 'Anger',
    title: 'Feeling Misunderstood',
    sourceReference:
        '$kScriptLibrarySourceDocument → ANGER → 1. Feeling Misunderstood',
    validationOpener: "I can imagine why you'd feel angry right now…",
    becauseStatements: [
      'because it might feel like no one stopped to really hear your side of things',
      'because you had something important to say and it might feel like it wasn\'t taken seriously',
      'because you were counting on things going differently and they didn\'t',
      'because it might feel like you\'re the only one who sees it this way',
      'because being misunderstood, especially by someone you care about, really hurts',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Sharing a Perspective',
        text: 'Your voice matters to me.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'I really do want to understand what happened from your point of view.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'We are in this together.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'I\'m glad you told me.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'I know you\'re doing the best you can right now',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Space + a Plan',
        text:
            'Let\'s take a short break and then sit down together so I can really listen, without distractions.',
      ),
      CategorizedOption(
        category: 'Reconnect Plan',
        text:
            'Let\'s find a quiet spot where just the two of us can talk it out properly.',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Let\'s figure out a plan to prevent this from happening again. What if I check in with you to make sure I understand what you are trying to say?',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'anger-feeling-powerless',
    emotion: 'Anger',
    title: 'Feeling Powerless',
    sourceReference:
        '$kScriptLibrarySourceDocument → ANGER → 2. Feeling Powerless',
    validationOpener: "No wonder you're angry…",
    becauseStatements: [
      'because so much of this feels out of your control right now',
      'because you\'ve been trying so hard with so little actually changing',
      'because it can feel really unfair when things won\'t budge no matter what you do',
      'because you want things to be different and you don\'t know how to make that happen',
      'because having no say in something that matters to you is really frustrating',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Positive Regard',
        text:
            'I see how hard you\'ve been trying, and I want you to know that.',
      ),
      CategorizedOption(
        category: 'Belief in Them',
        text: 'I believe you can get through this, and I\'m going to help.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'You don\'t have to figure this out alone.',
      ),
      CategorizedOption(
        category: 'Belief in Them',
        text:
            'I\'m proud of you for keeping at it even when it\'s been this hard.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'Your feelings make total sense to me.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Let\'s find one small thing we can actually change together, just one thing to start.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s start with the part of this that feels most out of control.',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Let\'s take a break from the big stuff and do something fun for a bit, then come back to it.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'anger-boundary-crossed',
    emotion: 'Anger',
    title: 'A Boundary Was Crossed',
    sourceReference:
        '$kScriptLibrarySourceDocument → ANGER → 3. A Boundary Was Crossed',
    validationOpener: "I could understand why you'd feel really angry…",
    becauseStatements: [
      'because something that really matters to you wasn\'t respected',
      'because you expected to be treated differently than that',
      'because it might feel like no one is taking your side right now',
      'because when someone crosses a line, it can feel both upsetting and scary at the same time',
      'because it\'s not okay for someone to treat you that way, and part of you knows that',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Positive Regard',
        text: 'Your feelings make complete sense to me.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text: 'I want to make space for what happened and help you feel safe.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'I\'m glad you told me, you were right to.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'You deserve to be treated with respect, and I am on your side.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'I\'m here, and I\'m not going to brush this off.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s go through exactly what happened together, so I can really understand.',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Let\'s talk about what you need right now to feel safe and okay.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Together let\'s figure out what we want to do about this, you don\'t have to decide alone.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'anger-feeling-overwhelmed',
    emotion: 'Anger',
    title: 'Feeling Overwhelmed',
    sourceReference:
        '$kScriptLibrarySourceDocument → ANGER → 6. Feeling Overwhelmed',
    validationOpener: "No wonder you're feeling overwhelmed…",
    becauseStatements: [
      'because everything has piled up at once and it is a lot to carry',
      'because you haven\'t had a moment to breathe and just be yourself',
      'because when too many things happen at once, anger can show up to say "this is too much"',
      'because you might feel stuck with no way out right now',
      'because you\'ve been dealing with a lot more than most people realize',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Togetherness',
        text: 'I\'m right here with you.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'It\'s completely okay to feel this way.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'You don\'t have to hold all of this by yourself.',
      ),
      CategorizedOption(
        category: 'Belief in Them',
        text:
            'I see how much you\'ve been dealing with, and I think you\'ve been really brave.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'We can figure this out together, one thing at a time.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Let\'s step outside or take a few minutes away from everything to reset.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s figure out together what the most pressing thing is and start just there, one thing.',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'I\'m going to take one thing off your plate right now, just for today.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'anger-old-hurts',
    emotion: 'Anger',
    title: 'Old Hurts Coming Up',
    sourceReference:
        '$kScriptLibrarySourceDocument → ANGER → 9. Old Hurts Coming Up',
    validationOpener: "It makes sense that you'd react right now…",
    becauseStatements: [
      'because this situation brings up something hard that happened before',
      'because when something hurt you in the past, it can come rushing back in moments like this',
      'because your body and brain remember painful things, even when you\'d rather they didn\'t',
      'because upset feelings can sometimes be a way of saying "I don\'t want this to happen again"',
      'because you\'ve been through some hard things, and that leaves a mark, and that is not your fault',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Togetherness',
        text: 'I\'m here with you in this, not on the other side of it.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'You don\'t have to carry this by yourself.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text:
            'What you\'re feeling makes total sense, even if it\'s hard to explain.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text:
            'I\'m not scared of what you\'re feeling and I\'m not going anywhere.',
      ),
      CategorizedOption(category: 'Reassurance', text: 'You are safe with me.'),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Space + a Plan',
        text: 'We can go as slowly as you need, there\'s no rush here.',
      ),
      CategorizedOption(
        category: 'Space + a Plan',
        text:
            'Let\'s take a break and then come back to it when your body feels a little calmer.',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Is there something that would help you feel a bit safer right now? Let\'s start by making a list of your favorite activities and choose one.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'anger-at-themselves',
    emotion: 'Anger',
    title: 'Angry at Themselves',
    sourceReference:
        '$kScriptLibrarySourceDocument → ANGER → 12. Angry at Themselves',
    validationOpener: "I can understand why you'd feel angry right now…",
    becauseStatements: [
      'because you care so much about doing things well and this didn\'t go the way you wanted',
      'because it\'s really frustrating when you know you can do better',
      'because maybe you feel like you let yourself or someone else down',
      'because being hard on yourself can sometimes feel like the right thing to do when things go wrong',
      'because you hold yourself to high standards and it stings when you don\'t meet them',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Togetherness',
        text: 'Everyone makes mistakes, it doesn\'t change how I see you.',
      ),
      CategorizedOption(
        category: 'Belief in Them',
        text: 'I\'m really proud of how much you care.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'Being kind to yourself is just as important as doing your best, and I want to help you with that.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text: 'You are so much more than this one moment.',
      ),
      CategorizedOption(
        category: 'Comfort / Love',
        text: 'I love you no matter what.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Set a Limit',
        text:
            'Being mean to yourself with harsh words isn\'t something we\'re going to allow, let\'s find a kinder way to talk to yourself.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s think about what you\'d say to a good friend who made the same mistake, and try saying that to yourself.',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Let\'s figure out one small thing you could do to help make it right.',
      ),
    ],
  ),

  // --- EMBARRASSMENT (15 Scenarios, renamed from Shame per Adele's review) ---
  ScriptLibraryExample(
    id: 'shame-withdraw-shutdown',
    emotion: 'Embarrassment',
    title: 'When They Withdraw or Shut Down',
    sourceReference:
        '$kScriptLibrarySourceDocument → SHAME → 5. When They Withdraw or Shut Down',
    validationOpener: "I can see why you'd want to pull away right now…",
    becauseStatements: [
      'because you might be worried about being misunderstood or judged',
      'because the feelings inside might feel hard and it might feel safer to go quiet',
      'because sometimes pulling back feels like the only way to stay okay',
      'because we haven’t always been in the habit of talking about the tough stuff',
      'because there have been times when I’ve definitely said or done the wrong thing',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Togetherness',
        text:
            'You don\'t have to hide from me - I\'m here to meet you with care, not judgment.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text: 'There\'s no pressure. I\'ll be here whenever you\'re ready.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'Your silence doesn’t scare me or make me mad. It makes sense.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'Even your silence is okay with me. I\'m right here.',
      ),
      CategorizedOption(
        category: 'Belief in Them',
        text: 'You matter to me, whether or not you can talk right now.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Space + a Plan',
        text:
            'We can talk a little now or come back to it later - whatever helps you feel safest.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let me help you to find one small thing that might make it easier to open up - even writing it down first.',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text: 'Want to go outside and get some fresh air for a bit?',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-messed-up',
    emotion: 'Embarrassment',
    title: 'When They Feel Like They Messed Up',
    sourceReference:
        '$kScriptLibrarySourceDocument → SHAME → 1. When They Feel Like They Messed Up',
    validationOpener: "I can understand why you'd feel embarrassed right now…",
    becauseStatements: [
      'because you really cared about doing this well and it didn\'t go the way you hoped',
      'because it didn\'t turn out the way you worked so hard for',
      'because you might be worried about what I think of you right now',
      'because when we care about something and it goes wrong, it can feel like it says something about who we are - even when it doesn\'t',
      'because it\'s hard not to feel bad when you know you could have done things differently',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Positive Regard',
        text:
            'You are still good, still loved, and still completely worthy - nothing about this changes that.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'One mistake doesn\'t define who you are.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'The fact that you feel bad about this tells me how much you care - and that matters.',
      ),
      CategorizedOption(
        category: 'Comfort / Love',
        text: 'I love you the same as I always have, and I always will.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'Everyone makes mistakes - you are very much not alone in this.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s look at what happened together - not to make you feel worse, but to figure out the next step side by side.',
      ),
      CategorizedOption(
        category: 'Soothing activity',
        text:
            'Let\'s work on a puzzle or play cards to give you a break from the feeling.',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'How about we take a breath, and then we\'ll come up with a plan together?',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-disappointed-you',
    emotion: 'Embarrassment',
    title: 'When They Feel Like They Disappointed You',
    sourceReference:
        '$kScriptLibrarySourceDocument → SHAME → 2. When They Feel Like They Disappointed You',
    validationOpener: "It makes sense you'd feel upset…",
    becauseStatements: [
      'because you care deeply about our relationship and maybe you didn\'t want to let me down',
      'because you were hoping I\'d be proud, and you\'re not sure right now if I am',
      'because when we love someone, we want them to feel good about us - and right now maybe you\'re not sure I do',
      'because it can be really scary to imagine that someone important to you is disappointed',
      'because you hold yourself to a high standard when it comes to the people you love',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Positive Regard',
        text: 'I still see your goodness, clearly and completely.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'This one moment doesn\'t change what I think of you.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'You are not a disappointment to me - not even close.',
      ),
      CategorizedOption(
        category: 'Comfort / Love',
        text:
            'I love you, and that\'s not something you can accidentally undo.',
      ),
      CategorizedOption(
        category: 'Belief in Them',
        text: 'I\'m proud of who you are, even in hard moments like this one.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Space + a Plan',
        text:
            'Let\'s talk through it gently, after a break. I\'ll come check on you in a few minutes.',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text: 'Once you\'re ready, we can figure out together what comes next.',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'How about a few minutes with a fidget toy or something in your hands?',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-unworthy',
    emotion: 'Embarrassment',
    title: 'When They Feel Unworthy',
    sourceReference:
        '$kScriptLibrarySourceDocument → SHAME → 3. When They Feel Unworthy',
    validationOpener: "I can imagine why you might be feeling crappy…",
    becauseStatements: [
      'because you\'ve been holding yourself to such a high standard and it\'s been really hard to feel like you measure up',
      'because you might be comparing yourself to others and coming up short in your own mind',
      'because feeling truly seen and worthy is something everyone needs, and right now that might feel far away',
      'because maybe some part of you is wondering if you\'re good enough - and that\'s a really painful place to be',
      'because when we\'re struggling, it can be easy for our brain to believe the worst things about ourselves',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Positive Regard',
        text: 'You are enough, exactly as you are, right now.',
      ),
      CategorizedOption(
        category: 'Comfort / Love',
        text: 'Nothing you share with me could make me stop caring about you.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'The way you see yourself in this moment is not the truth of who you are.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'You belong here, with me, and you are very, very loved.',
      ),
      CategorizedOption(
        category: 'Belief in Them',
        text:
            'I\'m not going anywhere, and I believe in you even when you don\'t.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Let\'s think about one small thing that could help you feel a little more grounded right now.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'Can I share some of the things I see in you that I think are really wonderful?',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'What would help you most right now - talking, doing something together, or just being here quietly?',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-self-blame',
    emotion: 'Embarrassment',
    title: "When They're Stuck in Self-Blame",
    // TODO: no Source reference in Adele's reviewed doc - flagged (with Sadness 4
    // and Anxiety 8) as possibly newly written rather than from the client source
    // doc. Confirm with Adele whether this reference should stay, change, or be removed.
    sourceReference:
        '$kScriptLibrarySourceDocument → SHAME → 4. When They\'re Stuck in Self-Blame',
    validationOpener: "I can understand why you'd feel to blame…",
    becauseStatements: [
      'because you\'ve been carrying this by yourself for a while now, and it might feel really heavy',
      'because it\'s really hard when your brain keeps telling you that this is all your fault',
      'because you were doing the best you could in a hard moment - even if it doesn\'t feel that way right now',
      'because blaming yourself can feel like the right thing to do when something goes wrong',
      'because you care so much about doing the right thing, and it hurts when you feel like you didn\'t',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Comfort / Love',
        text:
            'You deserve to be gentle with yourself - not to attack yourself.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'I\'m right here with you, and I\'m not judging you.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text: 'What happened was complicated, and you are not the whole story.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'I see you trying, and trying counts - a lot.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'You are worthy of kindness, especially from yourself.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s look at the whole picture together - not just the part you\'re blaming yourself for.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s think about this the way you would if it happened to a friend.',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Let me help you pick something small you could do today that might feel like a step in the right direction.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-fear-judged',
    emotion: 'Embarrassment',
    title: 'When They Fear Being Judged',
    sourceReference:
        '$kScriptLibrarySourceDocument → SHAME → 6. When They Fear Being Judged',
    validationOpener: "It makes sense you'd feel worried about being judged…",
    becauseStatements: [
      'because you weren\'t sure how I\'d react',
      'because being judged, especially by someone you love, is one of the most painful feelings there is',
      'because part of you might be bracing for me to be disappointed or upset',
      'because in the past, sharing hard things might not have always gone the way you hoped',
      'because showing people the harder parts of yourself takes courage, and it can feel risky',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Togetherness',
        text: 'I\'m not here to judge you. I\'m here to understand you.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'Whatever you share with me, I\'m on your side.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text:
            'I can see this took courage to bring to me, and I\'m really glad you did.',
      ),
      CategorizedOption(
        category: 'Comfort / Love',
        text:
            'There is nothing you could say that would make me love you less.',
      ),
      CategorizedOption(category: 'Reassurance', text: 'You are safe with me.'),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Space + a Plan',
        text: 'Let\'s take this slowly, at whatever pace feels right for you.',
      ),
      CategorizedOption(
        category: 'Space + a Plan',
        text:
            'You don\'t have to share everything at once - just what feels okay for right now.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Would it help if I asked you a few easy questions, rather than you having to start from scratch?',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-stupid-inadequate',
    emotion: 'Embarrassment',
    title: 'When They Feel Stupid or Inadequate',
    sourceReference:
        '$kScriptLibrarySourceDocument → SHAME → 7. When They Feel Stupid or Inadequate',
    validationOpener: "I can imagine you'd feel yucky right now…",
    becauseStatements: [
      'because this really mattered to you and you wanted to do it well',
      'because maybe you think other kids would have handled it differently or more easily',
      'because you care about being capable and good at things, and right now it might not feel that way',
      'because it can really sting when your brain tells you you\'re not smart enough or good enough',
      'because school or learning has been hard lately, and that\'s really frustrating and discouraging',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Positive Regard',
        text:
            'You are learning, growing, and trying - and that\'s what matters.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text: 'Your worth is not tied to how well you do on any one thing.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text:
            'Everyone struggles with some things - it\'s part of being human.',
      ),
      CategorizedOption(
        category: 'Belief in Them',
        text: 'I think you\'re smart in so many important ways.',
      ),
      CategorizedOption(
        category: 'Belief in Them',
        text: 'I\'m proud of you for trying, even when it\'s hard.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s break this down together and figure out where the hard part is - I\'ll help.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Maybe we can come up with a different approach that works better for how your brain works.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'I think we might need to make a list of your strengths together, so that you can remember how great you are.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-after-conflict',
    emotion: 'Embarrassment',
    title: 'After a Conflict or Outburst',
    sourceReference:
        '$kScriptLibrarySourceDocument → SHAME → 8. After a Conflict or Outburst',
    validationOpener:
        "I can understand why embarrassment is showing up right now…",
    becauseStatements: [
      'because the moment felt really big and intense, and it might have scared you a little too',
      'because you might wish you had reacted differently',
      'because after big feelings come out, it can feel embarrassing or really exposed',
      'because you might be worried that I see you differently now',
      'because it\'s hard to feel out of control, even for just a minute',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Sharing a Perspective',
        text: 'I see the whole you - not just that one moment.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'We can repair this together, and we will.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text:
            'Big feelings are part of being human. You are not bad for having them.',
      ),
      CategorizedOption(
        category: 'Comfort / Love',
        text: 'I love you, and this does not change that.',
      ),
      CategorizedOption(
        category: 'Belief in Them',
        text:
            'I\'m proud of you for still being here and being willing to talk.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Set a Limit',
        text:
            'It\'s okay to feel that upset - hitting or throwing things isn\'t okay, and we\'ll keep practicing safer ways to let big feelings out.',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Let\'s go over what I could have done differently so that we can have a better chance at resolving things the next time.',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Let me get you a glass of water or something comforting while we settle back down together.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-feel-different',
    emotion: 'Embarrassment',
    title: 'When They Feel Different From Others',
    sourceReference:
        '$kScriptLibrarySourceDocument → SHAME → 9. When They Feel Different From Others',
    validationOpener: "It makes sense you'd feel bad…",
    becauseStatements: [
      'because you\'re noticing that you\'re different in some way and it doesn\'t feel good right now',
      'because wanting to fit in and belong is a really normal need - especially at your age',
      'because it might feel lonely when you\'re not sure exactly where you belong',
      'because maybe you\'ve been compared to others, or felt left out in some way',
      'because the world can sometimes give people a hard time for being different, and that is not okay',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Togetherness',
        text: 'You belong with me - completely and always.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text:
            'The things that make you different are things I actually really love about you.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text: 'The right people will love the things that make you you.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text: 'You are not alone. I\'m right here.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'There is absolutely nothing wrong with you.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s think together about what helps you feel more connected and included.',
      ),
      CategorizedOption(
        category: 'Reconnect Plan',
        text:
            'Let\'s focus on a place or a group where you feel most like yourself.',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text: 'Let\'s go for a drive to get a break from the big feelings.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-from-past',
    emotion: 'Embarrassment',
    title: 'Embarrassment About Something From the Past',
    sourceReference:
        '$kScriptLibrarySourceDocument → SHAME → 10. Embarrassment About Something From the Past',
    validationOpener:
        "I can understand why this brings up bad feelings for you…",
    becauseStatements: [
      'because the memory might still feel alive inside you, even though it was a while ago',
      'because you\'ve been carrying this for a long time without anyone really knowing',
      'because back then you were younger and didn\'t have the tools or support you have now',
      'because it might feel like it says something about you as a person',
      'because shame lives longer when we carry it alone and keep it secret',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'You deserve to have compassion for the version of you that was younger and doing the best they could.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text:
            'You\'re carrying something you\'ve never had to carry alone - and now you don\'t have to.',
      ),
      CategorizedOption(
        category: 'Comfort / Love',
        text: 'This doesn\'t change how I see you or how much I love you.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text:
            'The fact that this still bothers you shows how much you care, and that\'s actually a strength.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'You were doing what you knew how to do at the time. That\'s all any of us can do.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Reconnect Plan',
        text:
            'If you\'d like, we can revisit that memory together with kindness and without shame.',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Let\'s find something fun to watch - sometimes a little distraction helps.',
      ),
      CategorizedOption(
        category: 'Space + a Plan',
        text:
            'You don\'t have to share all of it at once - even just telling me a little is a big, brave step.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-embarrassed-public',
    emotion: 'Embarrassment',
    title: 'Embarrassed in Front of Others',
    sourceReference:
        '$kScriptLibrarySourceDocument → SHAME → 11. Embarrassed in Front of Others',
    validationOpener: "No wonder you feel so embarrassed…",
    becauseStatements: [
      'because something private or difficult happened in front of other people',
      'because you care what your friends and classmates think of you',
      'because it might feel like everyone is still thinking about it, even if they\'re not',
      'because embarrassing moments have a way of feeling much bigger than they actually are',
      'because being seen struggling when you want to look okay is really hard',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Togetherness',
        text:
            'Embarrassing moments happen to literally everyone - you are not alone in this.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'What you\'re feeling makes complete sense.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text: 'This moment does not define you.',
      ),
      CategorizedOption(
        category: 'Comfort / Love',
        text: 'I love you, and this doesn\'t change anything about that.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'The people who really matter to you will forget this much faster than you think.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Let\'s get you somewhere comfortable and give things a chance to settle.',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Let\'s talk about what happened, or do something fun to take your mind off it for a bit - whichever you\'d rather.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Is there one person you\'re most worried about? Let\'s think through how to handle the next time you see them together.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-big-mistake',
    emotion: 'Embarrassment',
    title: 'After Making a Big Mistake',
    sourceReference:
        '$kScriptLibrarySourceDocument → SHAME → 12. After Making a Big Mistake',
    validationOpener: "I can imagine why you're feeling so bad right now…",
    becauseStatements: [
      'because what happened had real consequences, and you can see that',
      'because you didn\'t mean for things to go this way',
      'because you care about doing the right thing and this doesn\'t feel like it',
      'because you might be worried about what\'s going to happen next',
      'because making a big mistake can make you question yourself in a really painful way',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'Making a big mistake doesn\'t make you a bad person - it makes you human.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text:
            'I can see you feel real remorse, and that matters more than you know.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'We are going to get through this together.',
      ),
      CategorizedOption(
        category: 'Comfort / Love',
        text: 'I love you through the messy parts, not just the easy ones.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text: 'This is something you did - not something you are.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Let\'s talk about what happened and what we can do to make it right, step by step.',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Let\'s figure out an apology or an action that could help start to repair things.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s sit down together tonight and go through exactly what kind of support would help most - whether that\'s help fixing it, someone to talk to, or just some space to think.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-too-much',
    emotion: 'Embarrassment',
    title: 'Feeling Like Too Much or Unlovable',
    sourceReference:
        '$kScriptLibrarySourceDocument → SHAME → 13. Feeling Like Too Much or Unlovable',
    validationOpener: "I can understand why you might feel upset…",
    becauseStatements: [
      'because somewhere along the way, you got the message that parts of you are too big or too much',
      'because when you struggle or need a lot of support, you might worry that you\'re a burden',
      'because maybe it\'s felt like people pull away when things get hard for you',
      'because you might be wondering if anyone could really love all of you - the messy parts included',
      'because those kinds of thoughts are really painful, and they can feel very real even when they aren\'t true',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Comfort / Love',
        text: 'You are not too much for me. Not even a little bit.',
      ),
      CategorizedOption(
        category: 'Comfort / Love',
        text:
            'Every part of you - the hard parts, the messy parts, all of it - is something I love.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text:
            'You are not a burden. You are someone I love and want to be here for.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'You are so lovable, and I wish you could see what I see.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text: 'I\'m not going anywhere, no matter how hard things get.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Reconnect Plan',
        text:
            'Can we spend some time together - nothing big, just the two of us - so you can feel that I mean this?',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'I\'m going to check in with you a little more this week, just so you know I\'m here.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s talk through what\'s been making you feel this way, so we can work on it together.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-left-out',
    emotion: 'Embarrassment',
    title: 'After Being Left Out or Excluded',
    sourceReference:
        '$kScriptLibrarySourceDocument → SHAME → 14. After Being Left Out or Excluded',
    validationOpener: "No wonder you're feeling this way…",
    becauseStatements: [
      'because being left out hurts in a way that\'s really hard to put into words',
      'because you wanted to be included and you weren\'t, and that feels like a rejection',
      'because you might be wondering if there\'s something wrong with you - and there isn\'t',
      'because belonging is one of the things humans need most, and right now you don\'t feel like you have it',
      'because when friends leave you out, it can feel like proof of something bad about you, even though it isn\'t',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Positive Regard',
        text: 'There is nothing wrong with you.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'This says nothing about your value - not to me, and not in general.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'You belong with me, completely and always.',
      ),
      CategorizedOption(
        category: 'Comfort / Love',
        text:
            'I\'m really sorry this happened. It wasn\'t okay, and it wasn\'t your fault.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'The right friendships will feel different - and you deserve those.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Reconnect Plan',
        text:
            'Let\'s do something just for us today - something that makes you feel good.',
      ),
      CategorizedOption(
        category: 'Reconnect Plan',
        text:
            'Let\'s plan some time with another friend or person in your life you feel safe with.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s sit down together tonight and go through what happened, step by step, so I can help you to figure out what to do next.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-own-feelings',
    emotion: 'Embarrassment',
    title: 'Embarrassed of Their Own Feelings',
    sourceReference:
        '$kScriptLibrarySourceDocument → SHAME → 15. Embarrassed of Their Own Feelings',
    validationOpener:
        "I can imagine why you'd feel embarrassed of feeling this way…",
    becauseStatements: [
      'because maybe you\'ve gotten the message that your feelings are too big, too much, or not okay',
      'because you might feel like other kids don\'t struggle with this the way you do',
      'because you were hoping you could handle this on your own and you\'re finding it hard',
      'because showing emotions when you feel like you shouldn\'t can feel embarrassing',
      'because part of you might think that needing help is a weakness - and I want to show you it isn\'t',
    ],
    emotionalSupport: [
      // NOTE: this line still says "ashamed" in Adele's reviewed doc even though
      // the validation opener above and the title were both changed to "embarrassed" -
      // worth a quick check with her on whether this one was meant to be updated too.
      CategorizedOption(
        category: 'Positive Regard',
        text: 'Your feelings are never something to be ashamed of.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'Having big feelings is actually a sign of sensitivity and depth - those are real strengths.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'Coming to me with this took courage, and I\'m so glad you did.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'There is nothing wrong with needing support - everyone does.',
      ),
      CategorizedOption(
        category: 'Comfort / Love',
        text:
            'I love all of you - including the parts that feel things really deeply.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s talk through what\'s been going on so I can understand what kind of support would help most.',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'I\'m going to check in with you a little more often, especially in the moments that feel hardest.',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'I\'m going to work on making it easier and safer for you to come to me when you\'re struggling.',
      ),
    ],
  ),

  // --- HOPELESSNESS (6 Scenarios) ---
  ScriptLibraryExample(
    id: 'hopelessness-nothing-will-ever-change',
    emotion: 'Hopelessness',
    title: '"Nothing Will Ever Change"',
    sourceReference:
        '$kScriptLibrarySourceDocument → HOPELESSNESS → 1. "Nothing Will Ever Change"',
    validationOpener: 'I can understand why you feel hopeless right now…',
    becauseStatements: [
      'because you\'ve been trying for such a long time with not enough relief',
      'because you\'re exhausted from carrying this, inside and out',
      'because it might feel like you\'re doing this all by yourself and no one really gets it',
      'because when you try and try and nothing changes, it\'s hard to keep believing it will',
      'because it might be hard to even imagine what "better" would look like right now',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Togetherness',
        text:
            'You don\'t have to face this by yourself - I\'m right here and I\'m not going anywhere.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text:
            'I can see how tired you are, and you don\'t have to keep carrying this alone.',
      ),
      CategorizedOption(
        category: 'Belief in Them',
        text:
            'I don\'t know exactly when or how things will shift, but I believe they can - and I\'ll hold that hope for you until you can hold it yourself.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text:
            'You are trying so hard, and that means something, even when it doesn\'t feel like it.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'I am in this with you, all the way.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Let\'s choose one tiny thing we can do together today - something so small it feels actually doable.',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Let\'s take a break from the heavy stuff and just be together for a bit.',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Let\'s just focus on getting through the next hour together - I\'ll help you figure out what that looks like.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'hopelessness-nothing-i-do-matters',
    emotion: 'Hopelessness',
    title: '"Nothing I Do Matters"',
    sourceReference:
        '$kScriptLibrarySourceDocument → HOPELESSNESS → 3. "Nothing I Do Matters"',
    validationOpener: 'I understand why you\'d feel hopeless…',
    becauseStatements: [
      'because you\'ve been putting in so much effort and it doesn\'t seem to be paying off',
      'because the impact of what you\'re doing hasn\'t matched how hard you\'ve been trying',
      'because it can feel like there\'s no point in even trying when nothing seems to help',
      'because you\'ve given so much of yourself and you might feel like it\'s been for nothing',
      'because that feeling of "what\'s the point?" is incredibly painful and exhausting to live with',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'Your efforts matter - to me, and far more than you can see right now.',
      ),
      CategorizedOption(
        category: 'Belief in Them',
        text:
            'I notice how hard you try, even when it\'s hard, and I am proud of you.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text:
            'What you do and who you are matters deeply, even in moments when it doesn\'t feel that way.',
      ),
      CategorizedOption(
        category: 'Belief in Them',
        text: 'I believe in you, even when you don\'t believe in yourself.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text: 'You are making a difference, even if you can\'t see it yet.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s take a moment and name even one small thing that came from your efforts - however tiny.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s try something just a little different together and see what happens.',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Can we just take a break right now - not give up, just pause - and give your system a rest?',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'hopelessness-feeling-like-a-burden',
    emotion: 'Hopelessness',
    title: 'Feeling Like a Burden',
    sourceReference:
        '$kScriptLibrarySourceDocument → HOPELESSNESS → 5. Feeling Like a Burden',
    validationOpener: 'It makes sense you feel hopeless…',
    becauseStatements: [
      'because you\'re worried that your struggles are too much for the people around you',
      'because you care about the people you love and you don\'t want to weigh them down',
      'because you might not be able to see right now all the ways that you matter and are valued',
      'because carrying that worry - that you\'re a burden - on top of everything else is exhausting',
      'because the thought of being "too much" for the people you love is one of the most painful things there is',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Comfort / Love',
        text:
            'You are not a burden to me. You are someone I love and want to support.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text:
            'Being here for you is something I want to do - not something I do despite the hard parts.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text:
            'I would rather know you\'re struggling than have you carry this alone.',
      ),
      CategorizedOption(
        category: 'Belief in Them',
        text: 'You matter so much to me - please don\'t forget that.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text: 'Being here for you is not too much for me.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s set up a regular time each week - like Sunday nights - where we check in on how you\'re really doing.',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'I\'m going to take one thing off your plate today, like handling dinner or a chore, so you have a little more room to breathe.',
      ),
      CategorizedOption(
        category: 'Reconnect Plan',
        text:
            'Let\'s plan a half hour this weekend to do something just for fun - no talking about the hard stuff, just time together.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'hopelessness-feeling-like-no-one-understands',
    emotion: 'Hopelessness',
    title: 'Feeling Like No One Understands',
    sourceReference:
        '$kScriptLibrarySourceDocument → HOPELESSNESS → 7. Feeling Like No One Understands',
    validationOpener: 'I get why you feel hopeless…',
    becauseStatements: [
      'because it feels like people can\'t really see or grasp how bad it gets for you',
      'because you might feel invisible in your pain, like you\'re saying something and no one is really hearing it',
      'because being unseen makes everything feel even heavier',
      'because you\'ve probably tried to explain it and it hasn\'t come out right, or people haven\'t gotten it',
      'because feeling truly understood is one of the things we need most, and right now it might feel out of reach',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'I am trying, with everything I have, to see you as clearly as I can.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'Your experience matters deeply to me.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text:
            'I might not always get it perfectly right, but I am never going to stop trying to understand.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text:
            'You don\'t have to explain it perfectly - I\'ll keep trying to get it.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'You are not invisible to me. I see you.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s start with just one part of how it feels - I really want to understand.',
      ),
      CategorizedOption(
        category: 'Reconnect Plan',
        text:
            'Let\'s see if there\'s one person, place, or thing that makes you feel a little less alone and let\'s make a plan to get you connected.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s try putting it in writing - a note, a text, a drawing - whatever feels less challenging.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'hopelessness-no-point-in-trying-at-school',
    emotion: 'Hopelessness',
    title: 'No Point in Trying at School',
    sourceReference:
        '$kScriptLibrarySourceDocument → HOPELESSNESS → 13. No Point in Trying at School',
    validationOpener: 'I can understand why you\'d feel hopeless about school…',
    becauseStatements: [
      'because it\'s been hard and you haven\'t felt the kind of success that makes trying feel worth it',
      'because working hard without seeing results is discouraging for anyone',
      'because maybe school hasn\'t always felt like a place where things go well for you',
      'because you might have tried asking for help and not felt like it made a difference',
      'because when something feels impossible, the brain starts to ask "why bother" - and that makes complete sense',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Belief in Them',
        text:
            'I see how hard you\'ve been trying and I\'m proud of you for that.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'Your worth is not measured by your grades or how school is going.',
      ),
      CategorizedOption(
        category: 'Belief in Them',
        text:
            'I believe in your ability to figure this out - and I\'m going to help.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'You\'re not struggling because you\'re not smart. You\'re struggling, and those are very different things.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text:
            'We\'re going to figure this out together - you don\'t have to take this on alone.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s look together at what\'s making school feel the hardest right now and figure out what kind of support might actually help.',
      ),
      CategorizedOption(
        category: 'Reconnect Plan',
        text:
            'Can we talk to your teacher or a school counsellor together about what you\'re experiencing?',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Is there one subject or one part of school that feels a little more okay? Let\'s start with that and then I can help you with the tougher stuff.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'hopelessness-wanting-to-quit-something-they-once-loved',
    emotion: 'Hopelessness',
    title: 'Wanting to Quit Something They Once Loved',
    sourceReference:
        '$kScriptLibrarySourceDocument → HOPELESSNESS → 14. Wanting to Quit Something They Once Loved',
    validationOpener: 'I can understand why you\'d want to give up on this…',
    becauseStatements: [
      'because what used to feel fun or meaningful has started to feel really hard or draining',
      'because you might have had some difficult experiences with it lately that have taken the joy out',
      'because when something we love starts to cause pain, it\'s natural to want to protect ourselves from it',
      'because you might be exhausted or burned out, and that changes how everything feels',
      'because sometimes giving up can feel like the only way to get some relief',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Reassurance',
        text:
            'I\'m not going to force anything - this is your call and I respect that.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'I can see how much this has been weighing on you.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'Whatever you decide, I\'m on your side.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text:
            'It\'s okay to rest. It\'s okay to take a break. It\'s okay to feel conflicted.',
      ),
      CategorizedOption(
        category: 'Comfort / Love',
        text: 'I love you regardless of what you decide about this.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Let\'s take a two-week break from it instead of deciding for good right now, and then see how you feel.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s sit down this week and go through what\'s changed - I want to understand what made it stop feeling good.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'I\'ll talk to your coach/teacher about scaling back your involvement for now, so it feels more manageable, unless this is something you genuinely need to step away from for now.',
      ),
    ],
  ),

  // --- SADNESS (11 Scenarios) ---
  ScriptLibraryExample(
    id: 'sadness-hurt-by-something-that-happened',
    emotion: 'Sadness',
    title: 'Hurt by Something That Happened',
    sourceReference:
        '$kScriptLibrarySourceDocument → SADNESS → 1. Hurt by Something That Happened',
    validationOpener: 'I can understand why you feel sad…',
    becauseStatements: [
      'because what happened really hurt your heart',
      'because you cared about this and it went in a direction you didn\'t expect',
      'because it\'s hard to sit with that kind of pain, especially when you weren\'t expecting it',
      'because the things that hurt us most are usually the things we care about most',
      'because something that felt important to you got bruised, and that matters',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Togetherness',
        text: 'I\'m right here. You don\'t have to carry this feeling alone.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'What you\'re feeling makes complete sense to me.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text: 'I\'m so sorry this happened.',
      ),
      CategorizedOption(
        category: 'Comfort / Love',
        text: 'Your heart matters to me, and I want to take care of it.',
      ),
      CategorizedOption(
        category: 'Comfort / Love',
        text: 'I love you and I\'m not going anywhere.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Let\'s sit close together on the couch for a few minutes - just being near each other.',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'I\'m going to make you your favorite snack and bring it over in a bit.',
      ),
      CategorizedOption(
        category: 'Space + a Plan',
        text:
            'We can talk about it over a drive, or just sit together quietly for a while - whichever feels right.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'sadness-grieving-a-change-or-loss',
    emotion: 'Sadness',
    title: 'Grieving a Change or Loss',
    sourceReference:
        '$kScriptLibrarySourceDocument → SADNESS → 2. Grieving a Change or Loss',
    validationOpener: 'It makes sense you\'re feeling sad…',
    becauseStatements: [
      'because something important has shifted or gone, and that takes real time to adjust to',
      'because you\'re missing what used to be, and that kind of missing is real',
      'because loss - even when it seems small to others - can leave a real hole',
      'because it takes time to move through something like this, and you don\'t have to rush',
      'because you\'re having to adjust to a new normal that you didn\'t ask for',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Togetherness',
        text: 'Your sadness is welcome with me. I\'m here for all of it.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text:
            'Grief takes as long as it takes, and I\'ll be here the whole way.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text: 'You don\'t have to pretend you\'re okay when you\'re not.',
      ),
      CategorizedOption(
        category: 'Comfort / Love',
        text: 'I love you and I\'m not going to rush you.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'Missing things that mattered is one of the most human feelings there is.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Space + a Plan',
        text:
            'We can talk about what you miss, or just sit together for a while - I\'ll follow your lead on which one feels right.',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Let\'s make some hot chocolate and wrap ourselves up in your favorite blanket for a bit.',
      ),
      CategorizedOption(
        category: 'Reconnect Plan',
        text:
            'Let\'s find a small way to honor what\'s changed, so it doesn\'t feel like it\'s just disappearing.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'sadness-feeling-left-out-or-unseen',
    emotion: 'Sadness',
    title: 'Feeling Left Out or Unseen',
    sourceReference:
        '$kScriptLibrarySourceDocument → SADNESS → 3. Feeling Left Out or Unseen',
    validationOpener: 'I understand your sadness…',
    becauseStatements: [
      'because being overlooked really stings, especially by people you care about',
      'because everyone wants to feel included, and right now you don\'t feel that',
      'because it\'s painful when others don\'t seem to see your value',
      'because feeling left out can make you question yourself in ways that aren\'t fair or accurate',
      'because belonging is one of the most important needs we have, and right now yours isn\'t being met',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Togetherness',
        text: 'I see you. You matter - deeply.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'What you\'re feeling makes complete sense.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'You belong here, with me, fully and completely.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text:
            'I\'m sorry this is happening, and I want you to know you are so valued.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text: 'You don\'t have to feel invisible - not with me.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Reconnect Plan',
        text:
            'Let\'s take a moment to reconnect - maybe a walk, a snack, or just sitting side by side.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s go through what happened together, step by step, so I really understand what you\'re feeling left out of.',
      ),
      CategorizedOption(
        category: 'Reconnect Plan',
        text:
            'Let\'s think together about who in your life really does see you, and how we can nurture those relationships.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'sadness-not-knowing-why-they-re-sad',
    emotion: 'Sadness',
    title: 'Not Knowing Why They\'re Sad',
    sourceReference:
        '$kScriptLibrarySourceDocument → SADNESS → 5. Not Knowing Why They\'re Sad',
    validationOpener: 'It\'s okay to feel sad even when you\'re not sure why…',
    becauseStatements: [
      'because emotions sometimes rise on their own without any clear reason, and that is completely normal',
      'because your body is asking for gentleness and care right now',
      'because sometimes our feelings know something before our minds do',
      'because nothing feels steady when you\'re low, and that\'s okay',
      'because you don\'t always need a reason to feel sad - sometimes it just is, and that\'s valid',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Togetherness',
        text:
            'I\'m right here with you. You don\'t need to have an explanation to be held.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text:
            'You don\'t have to figure it out. I just want to be with you in it.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text:
            'Your feelings are always welcome here, even the unexplained ones.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text: 'It\'s okay not to have words for this.',
      ),
      CategorizedOption(
        category: 'Comfort / Love',
        text: 'I love you, with or without a reason.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Let\'s slow things down - maybe breathe together or find something soft and grounding.',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Let\'s grab your favorite blanket and just sit together for a few minutes.',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text: 'Let\'s put on some calm music and just be together for a while.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'sadness-feeling-lonely',
    emotion: 'Sadness',
    title: 'Feeling Lonely',
    sourceReference:
        '$kScriptLibrarySourceDocument → SADNESS → 6. Feeling Lonely',
    validationOpener: 'I get why you feel sad…',
    becauseStatements: [
      'because loneliness is one of the heaviest feelings there is',
      'because connection matters so much, especially at your age',
      'because it hurts when you feel alone inside even when people are around',
      'because you\'ve been going through something that doesn\'t feel fully shared or understood',
      'because everyone deserves to feel like they have people - real people who get them',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Reassurance',
        text: 'You\'re not alone right now - I\'m with you.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'I care about you and I want to be one of your people.',
      ),
      CategorizedOption(
        category: 'Belief in Them',
        text: 'You matter to me more than you know.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'Loneliness doesn\'t mean you\'re unlovable - it means you\'re human.',
      ),
      CategorizedOption(
        category: 'Comfort / Love',
        text: 'I love you, and I\'m glad you\'re with me right now.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Reconnect Plan',
        text:
            'Let\'s sit close together for a few minutes - I\'ll stay right here with you.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s think of one person you could reach out to today, and I\'ll help you send them a message.',
      ),
      CategorizedOption(
        category: 'Reconnect Plan',
        text:
            'Let\'s set up a regular time each week that\'s just for the two of us.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'sadness-tired-and-emotionally-worn-down',
    emotion: 'Sadness',
    title: 'Tired and Emotionally Worn Down',
    sourceReference:
        '$kScriptLibrarySourceDocument → SADNESS → 8. Tired and Emotionally Worn Down',
    validationOpener: 'It makes sense you feel sad…',
    becauseStatements: [
      'because you\'ve been carrying so much for so long',
      'because your body and heart feel genuinely worn out',
      'because when we\'re exhausted, sadness often rises to the surface',
      'because you haven\'t had enough time to really rest and restore yourself',
      'because you\'ve been giving so much and haven\'t had much coming back in return',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Comfort / Love',
        text: 'Let yourself soften here - I\'ve got you.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text: 'You don\'t have to be strong right now. Not with me.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'You deserve real rest - not just sleep, but emotional rest too.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'I see how tired you are and I want to help carry some of this.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text: 'I\'m here, and I\'m not going to ask anything of you right now.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Let\'s choose one small comforting thing - a blanket, a warm drink, or just resting together.',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'I\'m going to clear something off your plate today so you can actually rest.',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Let\'s get you into comfortable clothes and onto the couch for a while.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'sadness-processing-a-big-change',
    emotion: 'Sadness',
    title: 'Processing a Big Change',
    sourceReference:
        '$kScriptLibrarySourceDocument → SADNESS → 10. Processing a Big Change',
    validationOpener: 'I can see why you\'re sad…',
    becauseStatements: [
      'because this change shook things up in a way you weren\'t ready for',
      'because it takes real time to let go of the way things were',
      'because your heart is still adjusting to a new reality that came without warning',
      'because change - even when it\'s necessary - involves loss, and that\'s worth grieving',
      'because you might still be trying to figure out what this means for you going forward',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Togetherness',
        text: 'I\'m here - you don\'t have to move through this shift alone.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text: 'Take all the time you need. There\'s no timeline on grief.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'I\'ll walk through this with you, whatever the pace.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'It makes complete sense that you feel the way you do.',
      ),
      CategorizedOption(
        category: 'Comfort / Love',
        text: 'I love you, and I\'m not going anywhere.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Space + a Plan',
        text:
            'Let\'s sit together on the couch for a bit - we can talk about it, rest, or just be still, whatever feels right.',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Let\'s make some lemonade and sit together for a bit to help you settle.',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Let\'s check in with each other tonight and again tomorrow morning, so you\'re not carrying this alone one day at a time.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'sadness-when-something-good-has-ended',
    emotion: 'Sadness',
    title: 'When Something Good Has Ended',
    sourceReference:
        '$kScriptLibrarySourceDocument → SADNESS → 11. When Something Good Has Ended',
    validationOpener: 'I can understand why you\'d feel sad about this ending…',
    becauseStatements: [
      'because something that brought you real joy is now over',
      'because it\'s hard when something you love comes to an end, even when the ending is expected',
      'because good things ending can feel like a real little loss',
      'because you might be wondering if something that good will come along again',
      'because it\'s completely normal to feel sad when something wonderful finishes',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'The fact that you feel sad tells me how much this mattered - and that\'s beautiful.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'Good things can and do happen again, even though it doesn\'t feel that way right now.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text: 'It\'s okay to miss something that was wonderful.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text:
            'I\'m glad you had that experience, and I\'m here with you in the missing of it.',
      ),
      CategorizedOption(
        category: 'Comfort / Love',
        text: 'I love you and I\'m right here.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Reconnect Plan',
        text:
            'Let\'s do something to celebrate what this meant to you - maybe look back at photos or keep something small to remember it by.',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Let\'s plan something to look forward to this weekend, even something small.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s talk about your favourite parts of it while things settle.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'sadness-missing-someone',
    emotion: 'Sadness',
    title: 'Missing Someone',
    sourceReference:
        '$kScriptLibrarySourceDocument → SADNESS → 12. Missing Someone',
    validationOpener: 'I can understand why you\'re feeling sad…',
    becauseStatements: [
      'because missing someone you love is one of the most genuinely painful feelings',
      'because they\'re not here in the way you need them to be right now',
      'because you shared something real with them and the absence of that is felt',
      'because distance - whether it\'s physical or just feeling far from someone - can feel really hard',
      'because you just want to be with someone who matters to you, and right now you can\'t',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'The people who matter to us leave their mark on us - and that means something.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text: 'Missing someone is a sign of love, and that\'s not a bad thing.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text: 'I\'m so sorry you\'re carrying this feeling right now.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text:
            'I\'m here. I\'m not the same as who you\'re missing, but I love you and I\'m here.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'Your love for this person is real, and it matters.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s send them a message or make something for them together right now.',
      ),
      CategorizedOption(
        category: 'Reconnect Plan',
        text:
            'Let\'s do something that reminds us of them - like making their favorite meal or listening to a song they love.',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text: 'Let\'s just be together for a bit - no pressure, just comfort.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'sadness-a-pet-has-died-or-is-very-sick',
    emotion: 'Sadness',
    title: 'A Pet Has Died or Is Very Sick',
    sourceReference:
        '$kScriptLibrarySourceDocument → SADNESS → 13. A Pet Has Died or Is Very Sick',
    validationOpener: 'I can understand why your heart is so sore right now…',
    becauseStatements: [
      'because you loved them so much and they were a really important part of your life',
      'because losing a pet is a real loss - it\'s not a small thing',
      'because they were always there for you in a very special kind of way',
      'because animals love us in such a simple, pure way, and losing that is really hard',
      'because you might not know how to hold this kind of grief yet, and that\'s okay',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Reassurance',
        text: 'This is a real loss and it\'s completely okay to grieve it.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'Your love for them was real and it was beautiful.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text:
            'It\'s okay to cry, and it\'s okay to feel this for as long as you need to.',
      ),
      CategorizedOption(
        category: 'Comfort / Love',
        text: 'I\'m so sorry. I know how much they meant to you.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text: 'They were lucky to be so well loved.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Reconnect Plan',
        text:
            'Let\'s make something together to remember them - a small memory box or a photo you can keep.',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Let\'s sit together with a blanket for a while - I\'m right here.',
      ),
      CategorizedOption(
        category: 'Space + a Plan',
        text:
            'Let\'s give you some time to just feel this - no need to rush to feeling better.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'sadness-a-friendship-has-changed-or-ended',
    emotion: 'Sadness',
    title: 'A Friendship Has Changed or Ended',
    sourceReference:
        '$kScriptLibrarySourceDocument → SADNESS → 15. A Friendship Has Changed or Ended',
    validationOpener: 'I can understand why you\'re so sad about this…',
    becauseStatements: [
      'because friendships are incredibly important, especially at your age',
      'because you really cared about this person and losing that closeness hurts',
      'because changes in friendships can feel like a loss of a whole part of your life',
      'because you might be wondering what you did wrong, even if the answer is nothing',
      'because it\'s really painful when something that felt safe and good suddenly isn\'t anymore',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Reassurance',
        text: 'This is a real loss and it\'s okay to grieve it.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'What you\'re feeling makes complete sense.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'You were a good friend, and this doesn\'t change that.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'The right friendships will feel safe and lasting - and you deserve those.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'I\'m here for you, no matter how your friendships shift.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s go through what happened together, step by step, so I really understand.',
      ),
      CategorizedOption(
        category: 'Reconnect Plan',
        text:
            'Let\'s think about the other people in your life who value you - they\'re there even if it doesn\'t feel that way right now.',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Let\'s do something together today - like baking or a walk - to help your heart feel a little lighter.',
      ),
    ],
  ),

  // --- ANXIETY (13 Scenarios) - NOT yet reviewed against Adele's tracked-changes doc ---
  ScriptLibraryExample(
    id: 'anxiety-when-anxiety-spikes-suddenly',
    emotion: 'Anxiety',
    title: 'When Anxiety Spikes Suddenly',
    sourceReference:
        '$kScriptLibrarySourceDocument → ANXIETY → 1. When Anxiety Spikes Suddenly',
    validationOpener: 'I can understand why you feel anxious right now…',
    becauseStatements: [
      'because something in that moment felt uncertain or unsafe, and your body reacted',
      'because your nervous system picked up on something that felt like a threat, even if we can\'t name it',
      'because part of you is trying really hard to keep you safe, and this is how it does that',
      'because anxiety can come on fast, especially when you\'re already carrying a lot',
      'because your body is doing its job - it might just be working a little too hard right now',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Togetherness',
        text: 'I\'m right here - we can face this feeling together.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text: 'You are safe right now, and I\'m not going anywhere.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text:
            'I\'m not going to tell you to calm down - let\'s just settle together, slowly.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text: 'Your body is trying to help you. Let\'s help it relax a little.',
      ),
      CategorizedOption(category: 'Reassurance', text: 'I\'ve got you.'),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Let\'s take a slow breath together and look around to see what\'s actually safe right now.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Put your feet flat on the floor and tell me five things you can see - let\'s do that together.',
      ),
      CategorizedOption(
        category: 'Space + a Plan',
        text:
            'Can we move to a quieter spot and let your nervous system come down a little?',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'anxiety-dreading-something-upcoming',
    emotion: 'Anxiety',
    title: 'Dreading Something Upcoming',
    sourceReference:
        '$kScriptLibrarySourceDocument → ANXIETY → 2. Dreading Something Upcoming',
    validationOpener: 'It makes sense you\'re anxious…',
    becauseStatements: [
      'because this matters to you and you want it to go well',
      'because the unknown can feel really big and overwhelming',
      'because a wise part of you is trying to be prepared for what might happen',
      'because when we care about something, our body sometimes tries to protect us from disappointment ahead of time',
      'because you might have had hard experiences with things like this before, and your brain is remembering that',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Togetherness',
        text:
            'You don\'t have to figure this out alone - I\'ll walk with you through it.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text:
            'It makes complete sense that you\'re worried. This matters to you and that\'s not a bad thing.',
      ),
      CategorizedOption(
        category: 'Belief in Them',
        text:
            'I believe in you, even when you don\'t believe in yourself right now.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text: 'Whatever happens, I\'ll be right here.',
      ),
      CategorizedOption(
        category: 'Belief in Them',
        text:
            'We\'ve gotten through hard things before, and we\'ll get through this one too.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Let\'s break this into one tiny step and see what would help that first step feel more manageable.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Can we talk through what you\'re most worried about so we can see if there\'s anything we can prepare for?',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Is there something we can do today that would help you feel even a little more ready?',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'anxiety-anxiety-from-caring-too-much',
    emotion: 'Anxiety',
    title: 'Anxiety From Caring Too Much',
    sourceReference:
        '$kScriptLibrarySourceDocument → ANXIETY → 3. Anxiety From Caring Too Much',
    validationOpener: 'I get why you feel anxious…',
    becauseStatements: [
      'because you care deeply about how things go',
      'because you want to do well and the idea of not doing well doesn\'t sit right',
      'because caring so much is actually a really meaningful quality - it also sometimes pulls your body into over-alert mode',
      'because you\'re someone who takes things seriously, and that means things weigh more',
      'because the things that matter most to us are the things that make us most anxious - and that actually makes sense',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'The care that lives inside your anxiety is something I really respect.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'Caring this much is a quality I love about you.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'Your anxiety is not a flaw - it\'s a sign of how much heart you have.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text:
            'We\'re going to channel that care in a direction that helps you feel better.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'I\'m with you on this.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Let\'s put that care to use by figuring out one small thing you can actually do right now.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Is there any preparation we can do together that might make you feel a bit more in control?',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Can we also build in some time to do something that\'s purely for fun, with no pressure?',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'anxiety-when-anxiety-feels-irrational-but-very-real',
    emotion: 'Anxiety',
    title: 'When Anxiety Feels "Irrational" But Very Real',
    sourceReference:
        '$kScriptLibrarySourceDocument → ANXIETY → 4. When Anxiety Feels "Irrational" But Very Real',
    validationOpener: 'Your anxiety makes complete sense…',
    becauseStatements: [
      'because your body reacted before your mind had time to catch up',
      'because your nervous system is trying to warn you - it\'s just being extra cautious',
      'because anxiety doesn\'t need a logical reason to feel very, very real',
      'because the body has its own kind of memory that kicks in sometimes',
      'because that\'s just how our nervous systems are designed - they\'re built to protect us, sometimes too much',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Positive Regard',
        text:
            'I believe you. What you\'re feeling is real, even if we can\'t totally explain it.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text:
            'You\'re not being dramatic or overreacting - your body is doing something very normal.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'Let\'s meet this feeling gently, together.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text: 'There is nothing wrong with you. You\'re just human.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text: 'I\'m right here with you.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s try to separate "what my body feels" from "what\'s actually happening right now" - together.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Can we name three things that are real and true about this moment?',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text: 'What helps your body settle when it\'s done this before?',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'anxiety-overwhelmed-by-too-many-possibilities',
    emotion: 'Anxiety',
    title: 'Overwhelmed by Too Many Possibilities',
    sourceReference:
        '$kScriptLibrarySourceDocument → ANXIETY → 5. Overwhelmed by Too Many Possibilities',
    validationOpener: 'I understand the anxiety…',
    becauseStatements: [
      'because there are so many moving parts that it\'s hard to know where to look',
      'because uncertainty stacks up really fast in the mind when there\'s a lot going on',
      'because a part of you is trying to predict every possible outcome so you don\'t get caught off guard',
      'because too many choices or unknowns at once can genuinely feel like too much to hold',
      'because even very capable people can feel overwhelmed when there are too many things at once',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Togetherness',
        text:
            'I\'m with you - you don\'t have to manage all of those pieces alone.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'We can narrow this down together.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'You\'re not supposed to be able to hold all of that at once - that\'s not a failing.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'Let\'s take a breath and simplify, together.',
      ),
      CategorizedOption(
        category: 'Belief in Them',
        text: 'I believe we can figure this out.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Let\'s choose the one or two things that matter most right now and start just there.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s write out everything on your plate and figure out together what actually needs attention first.',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Is there something we can take off the list entirely, at least for today?',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'anxiety-afraid-of-making-a-mistake',
    emotion: 'Anxiety',
    title: 'Afraid of Making a Mistake',
    sourceReference:
        '$kScriptLibrarySourceDocument → ANXIETY → 6. Afraid of Making a Mistake',
    validationOpener: 'I can see why you\'re anxious…',
    becauseStatements: [
      'because you want to make a good choice and the stakes feel high',
      'because the consequences of getting it wrong feel really important',
      'because you care about doing the right thing and that comes from a really good place',
      'because making a mistake might feel like something that says something about who you are, even though it doesn\'t',
      'because a part of you wants to get it right so much that the idea of getting it wrong is really scary',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Sharing a Perspective',
        text: 'Your anxiety shows your values - that matters.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'There is almost never a perfect choice, just the best one you can make right now.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text:
            'Whatever happens, we\'ll be okay and we\'ll figure it out together.',
      ),
      CategorizedOption(
        category: 'Belief in Them',
        text: 'I trust your judgment more than you trust it right now.',
      ),
      CategorizedOption(
        category: 'Belief in Them',
        text: 'I\'m proud of how seriously you take things that matter.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s explore the options together and see which one feels most right - not perfect, just right.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text: 'Can we make a list of the pros and cons and talk through them?',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Is there someone we trust that we could get a second opinion from?',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'anxiety-anxiety-in-the-body-tight-chest-racing-heart',
    emotion: 'Anxiety',
    title: 'Anxiety in the Body (Tight Chest, Racing Heart)',
    sourceReference:
        '$kScriptLibrarySourceDocument → ANXIETY → 7. Anxiety in the Body (Tight Chest, Racing Heart)',
    validationOpener: 'Your anxiety makes sense…',
    becauseStatements: [
      'because your body is responding to something that feels intense or overwhelming',
      'because your nervous system is trying to protect you from something it sees as a threat',
      'because anxiety lives in the body - in the chest, the stomach, the throat - and that\'s really uncomfortable',
      'because your body is asking for support in the way it knows how to ask',
      'because when anxiety shows up physically, it can feel especially scary, and that adds to the feeling',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Togetherness',
        text:
            'I\'m right here - you don\'t have to "calm down"; let\'s settle together.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'What your body is doing makes sense, even if it\'s uncomfortable.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'We\'re going to get through this feeling together.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text: 'You are safe. I\'m right here.',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Let\'s just breathe for a minute and let your body know you\'re okay.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Try putting your hand where it feels strongest and breathing slowly into that spot - let\'s do it together.',
      ),
      CategorizedOption(
        category: 'Space + a Plan',
        text:
            'Can we move somewhere that feels a little more comfortable and quieter?',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Let\'s shake out our hands and arms, or take a short walk - movement can really help.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'anxiety-worrying-about-something-that-hasn-t-happened',
    emotion: 'Anxiety',
    title: 'Worrying About Something That Hasn\'t Happened',
    sourceReference:
        '$kScriptLibrarySourceDocument → ANXIETY → 8. Worrying About Something That Hasn\'t Happened',
    validationOpener: 'It makes sense to feel anxious…',
    becauseStatements: [
      'because your mind is scanning ahead and trying to prepare for the unknown',
      'because imagining the worst can be a way your brain tries to protect you from being surprised',
      'because a part of you wants to be ready, just in case - and that\'s actually a pretty smart instinct',
      'because you\'ve been through things before that caught you off guard, and your brain doesn\'t want that to happen again',
      'because the feeling is completely real, even if what you\'re worried about hasn\'t happened',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'Let\'s thank that part of you for trying to look out for you - and then gently guide it.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text:
            'I\'m here, and we\'re going to deal with what\'s in front of us together.',
      ),
      CategorizedOption(
        category: 'Belief in Them',
        text: 'You\'ve handled hard things before. I\'ve seen it.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'Whatever happens, we\'ll face it together.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text: 'You are not alone in this.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s name the worry once - just say it out loud - and then name three things that are actually true and safe right now.',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Is there something useful we can do to prepare, so your brain feels like it\'s done something?',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Can we do something that brings you into the present moment - something concrete and sensory?',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'anxiety-anxiety-linked-to-past-experiences',
    emotion: 'Anxiety',
    title: 'Anxiety Linked to Past Experiences',
    sourceReference:
        '$kScriptLibrarySourceDocument → ANXIETY → 9. Anxiety Linked to Past Experiences',
    validationOpener: 'I can understand your anxiety…',
    becauseStatements: [
      'because this moment touches something familiar - something that was hard before',
      'because your body and brain remember painful things, even when you\'d rather they didn\'t',
      'because memories of difficult experiences can show up in present moments without warning',
      'because your anxiety is trying to protect you from going through something hard again',
      'because what you\'ve been through before was real, and your nervous system is just trying to keep you safe',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Sharing a Perspective',
        text:
            'Your body\'s memory is welcome here - we\'ll move through this together.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text:
            'What happened before is not what\'s happening now, and you\'re safe with me.',
      ),
      CategorizedOption(
        category: 'Space + a Plan',
        text:
            'I\'m not going to rush you. We\'ll take this at whatever pace works for you.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text: 'I\'m here, right now, and I\'m not going anywhere.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'You don\'t have to go through this alone.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s anchor in this present moment together: where are we, who\'s here, and what\'s different now?',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Is there something that usually helps when past stuff comes up like this?',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Let\'s do something grounding together - something that helps you feel safe and in the present.',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'anxiety-school-or-learning-feels-overwhelming',
    emotion: 'Anxiety',
    title: 'School or Learning Feels Overwhelming',
    sourceReference:
        '$kScriptLibrarySourceDocument → ANXIETY → 11. School or Learning Feels Overwhelming',
    validationOpener:
        'I can understand why you\'d feel so anxious about school…',
    becauseStatements: [
      'because there\'s a lot expected of you and it can feel like too much sometimes',
      'because school is a place where you\'re evaluated a lot, and that kind of pressure really builds up',
      'because when learning is hard, it can feel like everyone else gets it more easily than you do',
      'because you might be worried about what happens if you can\'t keep up',
      'because there\'s already a lot going on in your life, and school is another big thing on top of it all',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Belief in Them',
        text: 'I see how hard you\'re working, and I\'m proud of you.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text:
            'You are not alone in finding school overwhelming - a lot of kids do.',
      ),
      CategorizedOption(
        category: 'Sharing a Perspective',
        text: 'Your worth is not measured by how school is going.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'I\'m going to help you figure this out.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text: 'You can always come to me when school feels like too much.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s break down what feels most overwhelming and see if we can make any of it smaller.',
      ),
      CategorizedOption(
        category: 'Reconnect Plan',
        text:
            'Can we reach out to your teacher or school together to get some extra support?',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Is there something we can do tonight that would help tomorrow feel a little more manageable?',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'anxiety-social-situations-feel-scary',
    emotion: 'Anxiety',
    title: 'Social Situations Feel Scary',
    sourceReference:
        '$kScriptLibrarySourceDocument → ANXIETY → 12. Social Situations Feel Scary',
    validationOpener: 'I can imagine why you\'d feel anxious…',
    becauseStatements: [
      'because social situations involve a lot of unpredictability, and that can be really hard',
      'because you care about what other people think and that makes things feel high stakes',
      'because you might be worried about saying the wrong thing or not being included',
      'because being around a lot of people can feel overstimulating or overwhelming',
      'because you want things to go well and you\'re not sure they will',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Togetherness',
        text:
            'Social stuff is genuinely hard, and you\'re not alone in finding it that way.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'What you\'re feeling makes complete sense.',
      ),
      CategorizedOption(
        category: 'Belief in Them',
        text:
            'I believe in you and I think you handle these situations better than you give yourself credit for.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text:
            'I\'m going to be here to support you before, during (if I can), and after.',
      ),
      CategorizedOption(
        category: 'Belief in Them',
        text:
            'You\'ve done hard social things before and you\'ve gotten through them.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Let\'s talk through what you\'re most worried about and see if we can prepare for it a little.',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Is there one person at this thing that you feel safe with? Let\'s plan to stay near them.',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Can we come up with an exit plan - something that makes it feel more okay to go, knowing you can leave if you need to?',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'anxiety-worried-about-their-body-or-health',
    emotion: 'Anxiety',
    title: 'Worried About Their Body or Health',
    sourceReference:
        '$kScriptLibrarySourceDocument → ANXIETY → 13. Worried About Their Body or Health',
    validationOpener: 'I can understand why you\'d feel anxious about this…',
    becauseStatements: [
      'because your body is important to you and any change or sensation can feel scary',
      'because when something doesn\'t feel right in your body, it\'s natural for your brain to go to worried places',
      'because we can\'t always explain every feeling in our bodies, and that uncertainty is hard',
      'because you want to be well and healthy, and this is worrying you',
      'because when you\'re already anxious, body sensations can feel even more intense and alarming',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Positive Regard',
        text: 'I take your concerns seriously and I want to help.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text:
            'We\'re going to look into this together so you don\'t have to carry the worry alone.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text: 'Whatever is going on, you\'re not dealing with it by yourself.',
      ),
      CategorizedOption(
        category: 'Positive Regard',
        text: 'I\'m glad you told me rather than holding it in.',
      ),
      CategorizedOption(
        category: 'Comfort / Love',
        text: 'I love you and your health matters to me very much.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Let\'s make an appointment with the doctor so we can get some real answers and put your mind at rest.',
      ),
      CategorizedOption(
        category: 'Share a Skill / Brainstorm',
        text:
            'Can you show me or describe what you\'re noticing so I can help figure out what to do?',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'While we wait for an appointment, is there something that might help you feel a bit less worried today?',
      ),
    ],
  ),
  ScriptLibraryExample(
    id: 'anxiety-bedtime-or-the-dark-feels-scary',
    emotion: 'Anxiety',
    title: 'Bedtime or the Dark Feels Scary',
    sourceReference:
        '$kScriptLibrarySourceDocument → ANXIETY → 14. Bedtime or the Dark Feels Scary',
    validationOpener: 'I can understand why bedtime feels so hard right now…',
    becauseStatements: [
      'because the dark and the quiet can make fears and worries feel much bigger than they do in the daytime',
      'because when you\'re alone with your thoughts at night, they can feel really overwhelming',
      'because being separated from us at night can feel scary, especially when other things are already hard',
      'because your imagination can be very active at night, and it can bring up really scary things',
      'because nighttime has its own particular kind of fear that\'s different from daytime',
    ],
    emotionalSupport: [
      CategorizedOption(
        category: 'Reassurance',
        text: 'You are safe, even when it doesn\'t feel that way.',
      ),
      CategorizedOption(
        category: 'Reassurance',
        text: 'I\'m just in the next room and you can always come to me.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text:
            'Night fears are so common - you are not the only kid who feels this way.',
      ),
      CategorizedOption(
        category: 'Comfort / Love',
        text: 'I love you and I want you to feel safe when you go to sleep.',
      ),
      CategorizedOption(
        category: 'Togetherness',
        text:
            'We\'re going to figure this out together so nights feel less scary.',
      ),
    ],
    practicalSupport: [
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Let\'s figure out something that helps your room feel safer at night - a light, a comfort object, a check-in routine.',
      ),
      CategorizedOption(
        category: 'Behavioral Plan',
        text:
            'Can we make a plan together for what to do when the scary feeling comes up at night?',
      ),
      CategorizedOption(
        category: 'Soothing Activity',
        text:
            'Let\'s set up a wind-down routine before bed - reading together and a few slow breaths.',
      ),
    ],
  ),
];

List<String> get scriptLibraryEmotions {
  return scriptLibraryExamples.map((e) => e.emotion).toSet().toList()..sort();
}

List<ScriptLibraryExample> examplesForEmotion(String emotion) {
  return scriptLibraryExamples.where((e) => e.emotion == emotion).toList();
}

ScriptLibraryExample? exampleById(String id) {
  for (final example in scriptLibraryExamples) {
    if (example.id == id) return example;
  }
  return null;
}
