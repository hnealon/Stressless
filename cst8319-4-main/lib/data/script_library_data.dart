import '../models/script_library_example.dart';

/// Client document used for all script library content.
const String kScriptLibrarySourceDocument =
    'EC_Scripts_Youth_Ages_8-12.revised.docx';

/// Script Builder library — wording verbatim from the client document.
const List<ScriptLibraryExample> scriptLibraryExamples = [
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
      'Your voice matters to me.',
      'I really do want to understand what happened from your point of view.',
      'We are in this together.',
      'I\'m glad you told me.',
      'I know you’re doing the best you can right now',
    ],
    practicalSupport: [
      'How about we take a short break and then sit down so I can really listen, without any distractions?',
      'Can you walk me through exactly what happened, from the beginning? I want to get the whole picture.',
      'Let\'s find a quiet spot where just the two of us can talk it out properly.',
      'Let’s figure out a plan to prevent this from happening again. What if __________?',
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
      'I see how hard you\'ve been trying, and I want you to know that.',
      'I believe you can get through this, and I\'m going to help.',
      'You don\'t have to figure this out alone.',
      'I\'m proud of you for keeping at it even when it\'s been this hard.',
      'Your feelings make total sense to me.',
    ],
    practicalSupport: [
      'Let\'s find one small thing we can actually change together — just one thing to start.',
      'What part of this feels most out of control? Let\'s start there.',
      'How about we take a break from the big stuff and do something fun for a bit, and then come back to it?',
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
      'Your feelings make complete sense to me.',
      'I want to make space for what happened and help you feel safe.',
      'I\'m glad you told me — you were right to.',
      'You deserve to be treated with respect, and I am on your side.',
      'I\'m here, and I\'m not going to brush this off.',
    ],
    practicalSupport: [
      'Can you tell me more about exactly what happened so I can really understand?',
      'Let\'s talk about what you need right now to feel safe and okay.',
      'Together let\'s figure out what we want to do about this — you don\'t have to decide alone.',
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
      'I\'m right here with you.',
      'It\'s completely okay to feel this way.',
      'You don\'t have to hold all of this by yourself.',
      'I see how much you\'ve been dealing with, and I think you\'ve been really brave.',
      'We can figure this out together, one thing at a time.',
    ],
    practicalSupport: [
      'How about we step outside or take a few minutes away from everything to reset?',
      'Let\'s figure out together what the most pressing thing is and start just there — one thing.',
      'Is there something we can take off your plate right now, even just for today?',
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
      'because you\'ve been through some hard things, and that leaves a mark — and that is not your fault',
    ],
    emotionalSupport: [
      'I\'m here with you in this — not on the other side of it.',
      'You don\'t have to carry this by yourself.',
      'What you\'re feeling makes total sense, even if it\'s hard to explain.',
      'I\'m not scared of what you\'re feeling and I\'m not going anywhere.',
      'You are safe with me.',
    ],
    practicalSupport: [
      'We can go as slowly as you need — there\'s no rush here.',
      'Let\'s take a break and then come back to it when your body feels a little calmer.',
      'Is there something that would help you feel a bit safer right now?',
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
      'Everyone makes mistakes — it doesn\'t change how I see you.',
      'I\'m really proud of how much you care.',
      'Being kind to yourself is just as important as doing your best, and I want to help you with that.',
      'You are so much more than this one moment.',
      'I love you no matter what.',
    ],
    practicalSupport: [
      'Let\'s talk about what happened so we can learn from it together — not to blame you, but to help.',
      'What would you say to a good friend who made the same mistake? Let\'s try saying that to yourself.',
      'Is there something you could do to help make it right, even just a little bit?',
    ],
  ),
  ScriptLibraryExample(
    id: 'silence-withdraw-shutdown',
    emotion: 'Silence',
    title: 'When They Withdraw or Shut Down',
    sourceReference:
        '$kScriptLibrarySourceDocument → SHAME → 5. When They Withdraw or Shut Down',
    validationOpener: "I can see why you'd want to pull away right now…",
    becauseStatements: [
      'because you might be worried about being misunderstood or judged',
      'because the feelings inside might fee hard and it might feel safer to go quiet',
      'because you might not even have the words yet for what you\'re feeling',
      'because sometimes pulling back feels like the only way to stay okay',
      'because we haven’t always been in the habit of talking about the tough stuff',
      'because there have been times when I’ve definitely said or done the wrong thing',
    ],
    emotionalSupport: [
      'You don\'t have to hide from me — I\'m here to meet you with care, not judgment.',
      'There\'s no pressure. I\'ll be here whenever you\'re ready.',
      'Your silence doesn’t scare me or make me mad. It makes sense.',
      'You can take your time. I\'m not going anywhere.',
      'Even your silence is okay with me. I\'m right here.',
      'You matter to me, whether or not you can talk right now.',
    ],
    practicalSupport: [
      'We can talk a little now or come back to it later — whatever helps you feel safest.',
      'Is there something that might make it feel even a tiny bit easier to open up?',
      'Would it help to do something together first, before we try to talk about it?',
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
