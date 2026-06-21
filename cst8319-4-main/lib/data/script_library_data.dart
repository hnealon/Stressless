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
      CategorizedOption(category: 'Sharing a Perspective', text: 'Your voice matters to me.'),
      CategorizedOption(category: 'Sharing a Perspective', text: 'I really do want to understand what happened from your point of view.'),
      CategorizedOption(category: 'Togetherness', text: 'We are in this together.'),
      CategorizedOption(category: 'Positive Regard', text: 'I\'m glad you told me.'),
      CategorizedOption(category: 'Positive Regard', text: 'I know you’re doing the best you can right now'),
    ],
    practicalSupport: [
      CategorizedOption(category: 'Space + a Plan', text: 'How about we take a short break and then sit down so I can really listen, without any distractions?'),
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'Can you walk me through exactly what happened, from the beginning? I want to get the whole picture.'),
      CategorizedOption(category: 'Reconnect Plan', text: 'Let\'s find a quiet spot where just the two of us can talk it out properly.'),
      CategorizedOption(category: 'Behavioral Plan', text: 'Let’s figure out a plan to prevent this from happening again. What if __________?'),
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
      CategorizedOption(category: 'Positive Regard', text: 'I see how hard you\'ve been trying, and I want you to know that.'),
      CategorizedOption(category: 'Belief in Them', text: 'I believe you can get through this, and I\'m going to help.'),
      CategorizedOption(category: 'Togetherness', text: 'You don\'t have to figure this out alone.'),
      CategorizedOption(category: 'Belief in Them', text: 'I\'m proud of you for keeping at it even when it\'s been this hard.'),
      CategorizedOption(category: 'Positive Regard', text: 'Your feelings make total sense to me.'),
    ],
    practicalSupport: [
      CategorizedOption(category: 'Behavioral Plan', text: 'Let\'s find one small thing we can actually change together — just one thing to start.'),
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'What part of this feels most out of control? Let\'s start there.'),
      CategorizedOption(category: 'Soothing Activity', text: 'How about we take a break from the big stuff and do something fun for a bit, and then come back to it?'),
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
      CategorizedOption(category: 'Positive Regard', text: 'Your feelings make complete sense to me.'),
      CategorizedOption(category: 'Reassurance', text: 'I want to make space for what happened and help you feel safe.'),
      CategorizedOption(category: 'Positive Regard', text: 'I\'m glad you told me — you were right to.'),
      CategorizedOption(category: 'Togetherness', text: 'You deserve to be treated with respect, and I am on your side.'),
      CategorizedOption(category: 'Togetherness', text: 'I\'m here, and I\'m not going to brush this off.'),
    ],
    practicalSupport: [
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'Can you tell me more about exactly what happened so I can really understand?'),
      CategorizedOption(category: 'Behavioral Plan', text: 'Let\'s talk about what you need right now to feel safe and okay.'),
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'Together let\'s figure out what we want to do about this — you don\'t have to decide alone.'),
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
      CategorizedOption(category: 'Togetherness', text: 'I\'m right here with you.'),
      CategorizedOption(category: 'Positive Regard', text: 'It\'s completely okay to feel this way.'),
      CategorizedOption(category: 'Togetherness', text: 'You don\'t have to hold all of this by yourself.'),
      CategorizedOption(category: 'Belief in Them', text: 'I see how much you\'ve been dealing with, and I think you\'ve been really brave.'),
      CategorizedOption(category: 'Togetherness', text: 'We can figure this out together, one thing at a time.'),
    ],
    practicalSupport: [
      CategorizedOption(category: 'Soothing Activity', text: 'How about we step outside or take a few minutes away from everything to reset?'),
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'Let\'s figure out together what the most pressing thing is and start just there — one thing.'),
      CategorizedOption(category: 'Behavioral Plan', text: 'Is there something we can take off your plate right now, even just for today?'),
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
      CategorizedOption(category: 'Togetherness', text: 'I\'m here with you in this — not on the other side of it.'),
      CategorizedOption(category: 'Togetherness', text: 'You don\'t have to carry this by yourself.'),
      CategorizedOption(category: 'Positive Regard', text: 'What you\'re feeling makes total sense, even if it\'s hard to explain.'),
      CategorizedOption(category: 'Reassurance', text: 'I\'m not scared of what you\'re feeling and I\'m not going anywhere.'),
      CategorizedOption(category: 'Reassurance', text: 'You are safe with me.'),
    ],
    practicalSupport: [
      CategorizedOption(category: 'Space + a Plan', text: 'We can go as slowly as you need — there\'s no rush here.'),
      CategorizedOption(category: 'Space + a Plan', text: 'Let\'s take a break and then come back to it when your body feels a little calmer.'),
      CategorizedOption(category: 'Soothing Activity', text: 'Is there something that would help you feel a bit safer right now?'),
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
      CategorizedOption(category: 'Togetherness', text: 'Everyone makes mistakes — it doesn\'t change how I see you.'),
      CategorizedOption(category: 'Belief in Them', text: 'I\'m really proud of how much you care.'),
      CategorizedOption(category: 'Sharing a Perspective', text: 'Being kind to yourself is just as important as doing your best, and I want to help you with that.'),
      CategorizedOption(category: 'Sharing a Perspective', text: 'You are so much more than this one moment.'),
      CategorizedOption(category: 'Comfort / Love', text: 'I love you no matter what.'),
    ],
    practicalSupport: [
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'Let\'s talk about what happened so we can learn from it together — not to blame you, but to help.'),
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'What would you say to a good friend who made the same mistake? Let\'s try saying that to yourself.'),
      CategorizedOption(category: 'Behavioral Plan', text: 'Is there something you could do to help make it right, even just a little bit?'),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-withdraw-shutdown',
    emotion: 'Shame',
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
      CategorizedOption(category: 'Togetherness', text: 'You don\'t have to hide from me — I\'m here to meet you with care, not judgment.'),
      CategorizedOption(category: 'Reassurance', text: 'There\'s no pressure. I\'ll be here whenever you\'re ready.'),
      CategorizedOption(category: 'Positive Regard', text: 'Your silence doesn’t scare me or make me mad. It makes sense.'),
      CategorizedOption(category: 'Reassurance', text: 'You can take your time. I\'m not going anywhere.'),
      CategorizedOption(category: 'Togetherness', text: 'Even your silence is okay with me. I\'m right here.'),
      CategorizedOption(category: 'Belief in Them', text: 'You matter to me, whether or not you can talk right now.'),
    ],
    practicalSupport: [
      CategorizedOption(category: 'Space + a Plan', text: 'We can talk a little now or come back to it later — whatever helps you feel safest.'),
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'Is there something that might make it feel even a tiny bit easier to open up?'),
      CategorizedOption(category: 'Soothing Activity', text: 'Would it help to do something together first, before we try to talk about it?'),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-messed-up',
    emotion: 'Shame',
    title: 'When They Feel Like They Messed Up',
    sourceReference:
    '$kScriptLibrarySourceDocument → SHAME → 1. When They Feel Like They Messed Up',
    validationOpener: "I can understand why you'd feel ashamed right now…",
    becauseStatements: [
      'because you really cared about doing this well and it didn\'t go the way you hoped',
      'because it didn\'t turn out the way you worked so hard for',
      'because you might be worried about what I think of you right now',
      'because when we care about something and it goes wrong, it can feel like it says something about who we are — even when it doesn\'t',
      'because it\'s hard not to feel bad when you know you could have done things differently',
    ],
    emotionalSupport: [
      CategorizedOption(category: 'Positive Regard', text: 'You are still good, still loved, and still completely worthy — nothing about this changes that.'),
      CategorizedOption(category: 'Positive Regard', text: 'One mistake doesn\'t define who you are.'),
      CategorizedOption(category: 'Sharing a Perspective', text: 'The fact that you feel bad about this tells me how much you care — and that matters.'),
      CategorizedOption(category: 'Comfort / Love', text: 'I love you the same as I always have, and I always will.'),
      CategorizedOption(category: 'Togetherness', text: 'Everyone makes mistakes — you are very much not alone in this.'),
    ],
    practicalSupport: [
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'Let\'s look at what happened together — not to make you feel worse, but to figure out the next step side by side.'),
      CategorizedOption(category: 'Behavioral Plan', text: 'Is there anything you\'d like to do to make things right? I\'ll help you.'),
      CategorizedOption(category: 'Soothing Activity', text: 'How about we take a breath, and then we\'ll come up with a plan together?'),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-disappointed-you',
    emotion: 'Shame',
    title: 'When They Feel Like They Disappointed You',
    sourceReference:
    '$kScriptLibrarySourceDocument → SHAME → 2. When They Feel Like They Disappointed You',
    validationOpener: "It makes sense you'd feel ashamed…",
    becauseStatements: [
      'because you care deeply about our relationship and you didn\'t want to let me down',
      'because you were hoping I\'d be proud, and you\'re not sure right now if I am',
      'because when we love someone, we want them to feel good about us — and right now you\'re not sure I do',
      'because it can be really scary to imagine that someone important to you is disappointed',
      'because you hold yourself to a high standard when it comes to the people you love',
    ],
    emotionalSupport: [
      CategorizedOption(category: 'Positive Regard', text: 'I still see your goodness, clearly and completely.'),
      CategorizedOption(category: 'Positive Regard', text: 'This one moment doesn\'t change what I think of you.'),
      CategorizedOption(category: 'Positive Regard', text: 'You are not a disappointment to me — not even close.'),
      CategorizedOption(category: 'Comfort / Love', text: 'I love you, and that\'s not something you can accidentally undo.'),
      CategorizedOption(category: 'Belief in Them', text: 'I\'m proud of who you are, even in hard moments like this one.'),
    ],
    practicalSupport: [
      CategorizedOption(category: 'Space + a Plan', text: 'Let\'s talk through it gently, at your pace — whenever you\'re ready.'),
      CategorizedOption(category: 'Soothing Activity', text: 'Is there something that would help you feel a bit better right now?'),
      CategorizedOption(category: 'Behavioral Plan', text: 'Once you\'re ready, we can figure out together what comes next.'),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-unworthy',
    emotion: 'Shame',
    title: 'When They Feel Unworthy',
    sourceReference:
    '$kScriptLibrarySourceDocument → SHAME → 3. When They Feel Unworthy',
    validationOpener: "I can imagine why shame is coming up for you right now…",
    becauseStatements: [
      'because you\'ve been holding yourself to such a high standard and it\'s been really hard to feel like you measure up',
      'because you might be comparing yourself to others and coming up short in your own mind',
      'because feeling truly seen and worthy is something everyone needs, and right now that might feel far away',
      'because maybe some part of you is wondering if you\'re good enough — and that\'s a really painful place to be',
      'because when we\'re struggling, it can be easy for our brain to believe the worst things about ourselves',
    ],
    emotionalSupport: [
      CategorizedOption(category: 'Positive Regard', text: 'You are enough, exactly as you are, right now.'),
      CategorizedOption(category: 'Comfort / Love', text: 'Nothing you share with me could make me stop caring about you.'),
      CategorizedOption(category: 'Sharing a Perspective', text: 'The way you see yourself in this moment is not the truth of who you are.'),
      CategorizedOption(category: 'Togetherness', text: 'You belong here, with me, and you are very, very loved.'),
      CategorizedOption(category: 'Belief in Them', text: 'I\'m not going anywhere, and I believe in you even when you don\'t.'),
    ],
    practicalSupport: [
      CategorizedOption(category: 'Soothing Activity', text: 'Let\'s think about one small thing that could help you feel a little more grounded right now.'),
      CategorizedOption(category: 'Sharing a Perspective', text: 'Can I share some of the things I see in you that I think are really wonderful?'),
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'What would help you most right now — talking, doing something together, or just being here quietly?'),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-self-blame',
    emotion: 'Shame',
    title: "When They're Stuck in Self-Blame",
    sourceReference:
    '$kScriptLibrarySourceDocument → SHAME → 4. When They\'re Stuck in Self-Blame',
    validationOpener: "I can understand why you'd feel so ashamed…",
    becauseStatements: [
      'because you\'ve been carrying this by yourself for a while now, and it feels really heavy',
      'because it\'s really hard when your brain keeps telling you that this is all your fault',
      'because you were doing the best you could in a hard moment — even if it doesn\'t feel that way right now',
      'because blaming yourself can feel like the right thing to do when something goes wrong',
      'because you care so much about doing the right thing, and it hurts when you feel like you didn\'t',
    ],
    emotionalSupport: [
      CategorizedOption(category: 'Comfort / Love', text: 'You deserve to be gentle with yourself — not to attack yourself.'),
      CategorizedOption(category: 'Togetherness', text: 'I\'m right here with you, and I\'m not judging you.'),
      CategorizedOption(category: 'Sharing a Perspective', text: 'What happened was complicated, and you are not the whole story.'),
      CategorizedOption(category: 'Positive Regard', text: 'I see you trying, and trying counts — a lot.'),
      CategorizedOption(category: 'Positive Regard', text: 'You are worthy of kindness, especially from yourself.'),
    ],
    practicalSupport: [
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'Let\'s look at the whole picture together — not just the part you\'re blaming yourself for.'),
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'Can we think about this together the way you\'d think about it if it happened to a friend?'),
      CategorizedOption(category: 'Behavioral Plan', text: 'Is there something small you could do today that might feel like a step in the right direction?'),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-fear-judged',
    emotion: 'Shame',
    title: 'When They Fear Being Judged',
    sourceReference:
    '$kScriptLibrarySourceDocument → SHAME → 6. When They Fear Being Judged',
    validationOpener: "It makes sense you'd feel ashamed…",
    becauseStatements: [
      'because you weren\'t sure how I\'d react',
      'because being judged, especially by someone you love, is one of the most painful feelings there is',
      'because part of you might be bracing for me to be disappointed or upset',
      'because in the past, sharing hard things might not have always gone the way you hoped',
      'because showing people the harder parts of yourself takes real courage, and it can feel really risky',
    ],
    emotionalSupport: [
      CategorizedOption(category: 'Togetherness', text: 'I\'m not here to judge you. I\'m here to understand you.'),
      CategorizedOption(category: 'Togetherness', text: 'Whatever you share with me, I\'m on your side.'),
      CategorizedOption(category: 'Positive Regard', text: 'I can see this took courage to bring to me, and I\'m really glad you did.'),
      CategorizedOption(category: 'Comfort / Love', text: 'There is nothing you could say that would make me love you less.'),
      CategorizedOption(category: 'Reassurance', text: 'You are safe with me.'),
    ],
    practicalSupport: [
      CategorizedOption(category: 'Space + a Plan', text: 'Let\'s take this slowly, at whatever pace feels right for you.'),
      CategorizedOption(category: 'Space + a Plan', text: 'You don\'t have to share everything at once — just what feels okay for right now.'),
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'Would it help if I asked you a few gentle questions, rather than you having to start from scratch?'),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-stupid-inadequate',
    emotion: 'Shame',
    title: 'When They Feel Stupid or Inadequate',
    sourceReference:
    '$kScriptLibrarySourceDocument → SHAME → 7. When They Feel Stupid or Inadequate',
    validationOpener: "I can imagine you'd feel ashamed right now…",
    becauseStatements: [
      'because this really mattered to you and you wanted to do it well',
      'because maybe you think other kids would have handled it differently or more easily',
      'because you care about being capable and good at things, and right now it doesn\'t feel that way',
      'because it can really sting when your brain tells you you\'re not smart enough or good enough',
      'because school or learning has been hard lately, and that\'s really frustrating and discouraging',
    ],
    emotionalSupport: [
      CategorizedOption(category: 'Positive Regard', text: 'You are learning, growing, and trying — and that\'s what actually matters.'),
      CategorizedOption(category: 'Sharing a Perspective', text: 'Your worth is not tied to how well you do on any one thing.'),
      CategorizedOption(category: 'Togetherness', text: 'Everyone struggles with some things — it\'s part of being human.'),
      CategorizedOption(category: 'Belief in Them', text: 'I think you\'re smart in so many important ways.'),
      CategorizedOption(category: 'Belief in Them', text: 'I\'m proud of you for trying, even when it\'s hard.'),
    ],
    practicalSupport: [
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'Let\'s break this down together and figure out where the hard part is — I\'ll help.'),
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'Maybe we can come up with a different approach that works better for how your brain works.'),
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'Is there a way I can support you with this that we haven\'t tried yet?'),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-after-conflict',
    emotion: 'Shame',
    title: 'After a Conflict or Outburst',
    sourceReference:
    '$kScriptLibrarySourceDocument → SHAME → 8. After a Conflict or Outburst',
    validationOpener: "I can understand why shame is showing up right now…",
    becauseStatements: [
      'because the moment felt really big and intense, and it might have scared you a little too',
      'because you might wish you had reacted differently',
      'because after big feelings come out, it can feel embarrassing or really exposed',
      'because you might be worried that I see you differently now',
      'because it\'s hard to feel out of control, even for just a minute',
    ],
    emotionalSupport: [
      CategorizedOption(category: 'Sharing a Perspective', text: 'I see the whole you — not just that one moment.'),
      CategorizedOption(category: 'Togetherness', text: 'We can repair this together, and we will.'),
      CategorizedOption(category: 'Positive Regard', text: 'Big feelings are part of being human. You are not bad for having them.'),
      CategorizedOption(category: 'Comfort / Love', text: 'I love you, and this does not change that.'),
      CategorizedOption(category: 'Belief in Them', text: 'I\'m proud of you for still being here and being willing to talk.'),
    ],
    practicalSupport: [
      CategorizedOption(category: 'Space + a Plan', text: 'When you\'re ready, let\'s talk about what was going on underneath those big feelings.'),
      CategorizedOption(category: 'Behavioral Plan', text: 'Is there anything you\'d like to do or say to help things feel better between us?'),
      CategorizedOption(category: 'Soothing Activity', text: 'Can I get you a glass of water or something comforting while we settle back down together?'),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-feel-different',
    emotion: 'Shame',
    title: 'When They Feel Different From Others',
    sourceReference:
    '$kScriptLibrarySourceDocument → SHAME → 9. When They Feel Different From Others',
    validationOpener: "It makes sense you'd feel ashamed…",
    becauseStatements: [
      'because you\'re noticing that you\'re different in some way and it doesn\'t feel good right now',
      'because wanting to fit in and belong is a really deep, really normal need — especially at your age',
      'because it can feel lonely when you\'re not sure exactly where you belong',
      'because maybe you\'ve been compared to others, or felt left out in some way',
      'because the world can sometimes give people a hard time for being different, and that is not okay',
    ],
    emotionalSupport: [
      CategorizedOption(category: 'Togetherness', text: 'You belong with me — completely and always.'),
      CategorizedOption(category: 'Positive Regard', text: 'The things that make you different are things I actually really love about you.'),
      CategorizedOption(category: 'Sharing a Perspective', text: 'The right people will love the things that make you you.'),
      CategorizedOption(category: 'Reassurance', text: 'You are not alone. I\'m right here.'),
      CategorizedOption(category: 'Positive Regard', text: 'There is absolutely nothing wrong with you.'),
    ],
    practicalSupport: [
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'Let\'s think together about what helps you feel more connected and included.'),
      CategorizedOption(category: 'Reconnect Plan', text: 'Is there a place or a group where you feel most like yourself? Let\'s nurture that.'),
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'Can we talk about what\'s been happening and figure out if there\'s something we can do about it?'),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-from-past',
    emotion: 'Shame',
    title: 'Shame About Something From the Past',
    sourceReference:
    '$kScriptLibrarySourceDocument → SHAME → 10. Shame About Something From the Past',
    validationOpener: "I can understand why this brings up shame for you…",
    becauseStatements: [
      'because the memory still feels alive inside you, even though it was a while ago',
      'because you\'ve been carrying this quietly for a long time without anyone really knowing',
      'because back then you were younger and didn\'t have the tools or support you have now',
      'because it might feel like it says something about you as a person — and I want you to know it doesn\'t',
      'because shame lives longer when we carry it alone and keep it secret',
    ],
    emotionalSupport: [
      CategorizedOption(category: 'Sharing a Perspective', text: 'You deserve to have compassion for the version of you that was younger and doing the best they could.'),
      CategorizedOption(category: 'Togetherness', text: 'You\'re carrying something you\'ve never had to carry alone — and now you don\'t have to.'),
      CategorizedOption(category: 'Comfort / Love', text: 'This doesn\'t change how I see you or how much I love you.'),
      CategorizedOption(category: 'Positive Regard', text: 'The fact that this still bothers you shows how much you care, and that\'s actually a strength.'),
      CategorizedOption(category: 'Sharing a Perspective', text: 'You were doing what you knew how to do at the time. That\'s all any of us can do.'),
    ],
    practicalSupport: [
      CategorizedOption(category: 'Reconnect Plan', text: 'If you\'d like, we can revisit that memory together with kindness and without shame.'),
      CategorizedOption(category: 'Soothing Activity', text: 'Is there anything that would help you feel less alone with this?'),
      CategorizedOption(category: 'Space + a Plan', text: 'You don\'t have to share all of it at once — even just telling me a little is a big, brave step.'),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-embarrassed-public',
    emotion: 'Shame',
    title: 'Embarrassed in Front of Others',
    sourceReference:
    '$kScriptLibrarySourceDocument → SHAME → 11. Embarrassed in Front of Others',
    validationOpener: "No wonder you feel so embarrassed and ashamed…",
    becauseStatements: [
      'because something private or difficult happened in front of other people',
      'because you care what your friends and classmates think of you',
      'because it might feel like everyone is still thinking about it, even if they\'re not',
      'because embarrassing moments have a way of feeling much bigger than they actually are',
      'because being seen struggling when you want to look okay is really hard',
    ],
    emotionalSupport: [
      CategorizedOption(category: 'Togetherness', text: 'Embarrassing moments happen to literally everyone — you are not alone in this.'),
      CategorizedOption(category: 'Positive Regard', text: 'What you\'re feeling makes complete sense.'),
      CategorizedOption(category: 'Sharing a Perspective', text: 'This moment does not define you.'),
      CategorizedOption(category: 'Comfort / Love', text: 'I love you, and this doesn\'t change anything about that.'),
      CategorizedOption(category: 'Sharing a Perspective', text: 'The people who really matter to you will forget this much faster than you think.'),
    ],
    practicalSupport: [
      CategorizedOption(category: 'Soothing Activity', text: 'Let\'s get you somewhere comfortable and give things a chance to settle.'),
      CategorizedOption(category: 'Soothing Activity', text: 'Would it help to talk about what happened, or would you rather do something fun to take your mind off it for a bit?'),
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'Is there one person you\'re most worried about? Let\'s think through that together.'),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-big-mistake',
    emotion: 'Shame',
    title: 'After Making a Big Mistake',
    sourceReference:
    '$kScriptLibrarySourceDocument → SHAME → 12. After Making a Big Mistake',
    validationOpener: "I can imagine why you're feeling so ashamed right now…",
    becauseStatements: [
      'because what happened had real consequences, and you can see that',
      'because you didn\'t mean for things to go this way',
      'because you care about doing the right thing and this doesn\'t feel like it',
      'because you might be worried about what\'s going to happen next',
      'because making a big mistake can make you question yourself in a really painful way',
    ],
    emotionalSupport: [
      CategorizedOption(category: 'Sharing a Perspective', text: 'Making a big mistake doesn\'t make you a bad person — it makes you human.'),
      CategorizedOption(category: 'Positive Regard', text: 'I can see you feel real remorse, and that matters more than you know.'),
      CategorizedOption(category: 'Togetherness', text: 'We are going to get through this together.'),
      CategorizedOption(category: 'Comfort / Love', text: 'I love you through the messy parts, not just the easy ones.'),
      CategorizedOption(category: 'Sharing a Perspective', text: 'This is something you did — not something you are.'),
    ],
    practicalSupport: [
      CategorizedOption(category: 'Behavioral Plan', text: 'Let\'s talk about what happened and what we can do to make it right, step by step.'),
      CategorizedOption(category: 'Behavioral Plan', text: 'Is there an apology or an action that would help start to repair things?'),
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'What do you need from me right now to feel supported through this?'),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-too-much',
    emotion: 'Shame',
    title: 'Feeling Like Too Much or Unlovable',
    sourceReference:
    '$kScriptLibrarySourceDocument → SHAME → 13. Feeling Like Too Much or Unlovable',
    validationOpener: "I can understand why you might feel ashamed…",
    becauseStatements: [
      'because somewhere along the way, you got the message that parts of you are too big or too much',
      'because when you struggle or need a lot of support, you might worry that you\'re a burden',
      'because maybe it\'s felt like people pull away when things get hard for you',
      'because you might be wondering if anyone could really love all of you — the messy parts included',
      'because those kinds of thoughts are really painful, and they can feel very real even when they aren\'t true',
    ],
    emotionalSupport: [
      CategorizedOption(category: 'Comfort / Love', text: 'You are not too much for me. Not even a little bit.'),
      CategorizedOption(category: 'Comfort / Love', text: 'Every part of you — the hard parts, the messy parts, all of it — is something I love.'),
      CategorizedOption(category: 'Togetherness', text: 'You are not a burden. You are someone I love and want to be here for.'),
      CategorizedOption(category: 'Positive Regard', text: 'You are so lovable, and I wish you could see what I see.'),
      CategorizedOption(category: 'Reassurance', text: 'I\'m not going anywhere, no matter how hard things get.'),
    ],
    practicalSupport: [
      CategorizedOption(category: 'Reconnect Plan', text: 'Can we spend some time together — nothing big, just the two of us — so you can feel that I mean this?'),
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'Is there something specific that made you start feeling this way that we can talk through together?'),
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'What would help you feel most loved and cared for right now?'),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-left-out',
    emotion: 'Shame',
    title: 'After Being Left Out or Excluded',
    sourceReference:
    '$kScriptLibrarySourceDocument → SHAME → 14. After Being Left Out or Excluded',
    validationOpener: "No wonder you're feeling this way…",
    becauseStatements: [
      'because being left out hurts in a way that\'s really hard to put into words',
      'because you wanted to be included and you weren\'t, and that feels like a rejection',
      'because you might be wondering if there\'s something wrong with you — and there isn\'t',
      'because belonging is one of the things humans need most, and right now you don\'t feel like you have it',
      'because when friends leave you out, it can feel like proof of something bad about you, even though it isn\'t',
    ],
    emotionalSupport: [
      CategorizedOption(category: 'Positive Regard', text: 'There is nothing wrong with you.'),
      CategorizedOption(category: 'Sharing a Perspective', text: 'This says nothing about your value — not to me, and not in general.'),
      CategorizedOption(category: 'Togetherness', text: 'You belong with me, completely and always.'),
      CategorizedOption(category: 'Comfort / Love', text: 'I\'m really sorry this happened. It wasn\'t okay, and it wasn\'t your fault.'),
      CategorizedOption(category: 'Sharing a Perspective', text: 'The right friendships will feel different — and you deserve those.'),
    ],
    practicalSupport: [
      CategorizedOption(category: 'Reconnect Plan', text: 'Let\'s do something just for us today — something that makes you feel good.'),
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'Can you tell me more about what happened so I can really understand?'),
      CategorizedOption(category: 'Reconnect Plan', text: 'Is there another friend or person in your life you feel safe with that we could plan some time with?'),
    ],
  ),
  ScriptLibraryExample(
    id: 'shame-own-feelings',
    emotion: 'Shame',
    title: 'Ashamed of Their Own Feelings',
    sourceReference:
    '$kScriptLibrarySourceDocument → SHAME → 15. Ashamed of Their Own Feelings',
    validationOpener: "I can imagine why you'd feel ashamed of feeling this way…",
    becauseStatements: [
      'because maybe you\'ve gotten the message that your feelings are too big, too much, or not okay',
      'because you might feel like other kids don\'t struggle with this the way you do',
      'because you were hoping you could handle this on your own and you\'re finding it hard',
      'because showing emotions when you feel like you shouldn\'t can feel embarrassing',
      'because part of you might think that needing help is a weakness — and I want to show you it isn\'t',
    ],
    emotionalSupport: [
      CategorizedOption(category: 'Positive Regard', text: 'Your feelings are never something to be ashamed of.'),
      CategorizedOption(category: 'Sharing a Perspective', text: 'Having big feelings is actually a sign of sensitivity and depth — those are real strengths.'),
      CategorizedOption(category: 'Positive Regard', text: 'Coming to me with this took courage, and I\'m so glad you did.'),
      CategorizedOption(category: 'Togetherness', text: 'There is nothing wrong with needing support — everyone does.'),
      CategorizedOption(category: 'Comfort / Love', text: 'I love all of you — including the parts that feel things really deeply.'),
    ],
    practicalSupport: [
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'Let\'s talk about what\'s been going on and figure out together what kind of support might help most.'),
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'Are there some feelings or situations that are especially hard? Let\'s name them and make a plan.'),
      CategorizedOption(category: 'Share a Skill / Brainstorm', text: 'Is there something I can do differently so it feels safer for you to come to me when you\'re struggling?'),
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
