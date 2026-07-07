import '../models/models.dart';

final List<Scenario> scenarioData = [
  Scenario(
    id: 'test-anxiety',
    title: 'Worried About a Test',
    childAge: '9 years old',
    emotionTag: 'Anxiety',
    situation:
        'Your child comes home from school looking upset. They just found out they have a big math test tomorrow.',
    childStatement:
        '"I can\'t do this. I\'m going to fail and everyone will laugh at me."',
    automaticResponses: [
      AutomaticResponse(
          text: '"You\'ll be fine! You\'re so good at math!"', type: 'reassuring', microfeedback: 'This is a common way to reassure, but it can sometimes dismiss the child\'s real fear of failure.' ),
      AutomaticResponse(
        text: '"Let\'s make a study plan right now and drill some problems."',
        type: 'problem-solving',
          microfeedback: 'Jumping straight to solutions can feel like pressure and skip over the child\'s immediate need for emotional support.'
      ),
      AutomaticResponse(
        text: '"A single test doesn\'t define you. It\'s not the end of the world."',
        type: 'rationalising',
          microfeedback: 'While true, this can minimize the child\'s feelings. To them, in this moment, it feels like a very big deal.'
      ),
      AutomaticResponse(
        text: '"Don\'t worry about it. How about we watch a movie?"',
        type: 'distraction',
          microfeedback: 'Distraction can provide a temporary escape, but it doesn\'t help the child process their anxiety or build coping skills.'
      ),
    ],
    validationContent: ValidationContent(
        validationSentences: [
          'I could understand if you might feel worried about your test',
          'I can imagine you feel worried about your test',
          'No wonder you feel worried about your test',
          'It makes sense that you feel worried about your test',
          'I will never fully understand, but when I try to put myself in your shoes, I imagine you feel worried about your test',
          'When I try to see it from your perspective, I imagine you might feel worried about your test',
        ],
        becauseStatements: [
          'because you want to do well and it\'s important to you',
          'because this test feels like a really big deal',
          'because you care about what your friends think',
          'because it\'s hard when you don\'t know what to expect',
          'because you want to make me proud',
          'because you\'re feeling a lot of pressure right now'
        ]),
    emotionalSupportOptions: [
      'I\'m here with you, and we can get through this together.',
      'Your feelings make complete sense to me.',
      'It\'s okay to feel scared. That feeling won\'t last forever.',
      'I love you, and that doesn\'t depend on how any test goes.',
      'You don\'t have to face this alone.'
    ],
    practicalSupportOptions: [
      'Right now, I can just be here with you.',
      'Would it help to look over the material together for a little while?',
      'We could write down the things you do know to help you feel more ready.',
      'Would you like to talk through what worries you most about the test?',
      'Let\'s make sure you get a good rest tonight so you feel your best.'
    ],
  ),
  Scenario(
    id: 'left-out',
    title: 'Left Out by Friends',
    childAge: '8 years old',
    emotionTag: 'Sadness',
    situation:
        'Your child comes home quieter than usual. At dinner, they tell you they weren\'t included in a game at recess and sat alone.',
    childStatement: '"Nobody likes me. I don\'t want to go to school anymore."',
    automaticResponses: [
       AutomaticResponse(
          text: '"I\'m sure they didn\'t mean to hurt your feelings."', type: 'rationalising', microfeedback: 'This tries to fix the situation by explaining the friends\' intentions, but it can make the child feel like their own feelings are wrong.' ),
      AutomaticResponse(
        text: '"Well, who needs them anyway? You can find other friends."',
        type: 'problem-solving',
          microfeedback: 'This jumps to a solution and dismisses the hurt the child is feeling about this specific friendship.'
      ),
      AutomaticResponse(
        text: '"What did you do that made them not want to play with you?"',
        type: 'blaming',
          microfeedback: 'This question, even if well-intentioned, can sound like you\'re blaming your child for the situation, increasing their sense of shame.'
      ),
      AutomaticResponse(
        text: '"Let\'s go get ice cream and forget all about it."',
        type: 'distraction',
          microfeedback: 'While a nice offer, it teaches the child to avoid or suppress painful feelings rather than process them.'
      ),
    ],
    validationContent: ValidationContent(
        validationSentences: [
          'I could understand if you might feel left out by your friends',
          'I can imagine you feel left out by your friends',
          'No wonder you feel left out by your friends',
          'It makes sense that you feel left out by your friends',
          'I will never fully understand, but when I try to put myself in your shoes, I imagine you feel left out by your friends',
          'When I try to see it from your perspective, I imagine you might feel left out by your friends',
        ],
        becauseStatements: [
          'because you really value your friendships',
          'because you were hoping for a fun time with your friends',
          'because it\'s a heavy feeling to sit with',
          'because feeling connected is important',
          'because it hurts to feel alone',
          'because you wanted to be part of the fun'
        ]),
    emotionalSupportOptions: [
      'I\'m so glad you told me how you\'re feeling.',
      'You don\'t have to carry this feeling alone.',
      'What you\'re feeling makes complete sense.',
      'I love you exactly as you are.',
      'Being left out is a really hard experience, and your hurt is real.'
    ],
    practicalSupportOptions: [
      'Right now, I can just be here with you.',
      'Would it help to talk about what happened today?',
      'Is there anything you\'d like from me right now?',
      'Would you like some quiet time, or would you rather be with me for a bit?',
      'We could think together, when you\'re ready, about how tomorrow might go.'
    ],
  ),
  Scenario(
    id: 'sibling-anger',
    title: 'Angry at a Sibling',
    childAge: '7 years old',
    emotionTag: 'Anger',
    situation:
        'Your younger child runs to you furious after their older sibling broke their favourite toy during an argument.',
    childStatement: '"I hate them! They always ruin everything. It\'s not fair!"',
    automaticResponses: [
       AutomaticResponse(
          text: '"It\'s just a toy. It\'s not a big deal."', type: 'minimizing', microfeedback: 'This dismisses the child\'s feelings by judging the importance of the object, rather than acknowledging the emotional meaning it held for them.' ),
      AutomaticResponse(
        text: '"You need to learn to share your things better."',
        type: 'lecturing',
          microfeedback: 'This response shifts blame to the upset child and turns the moment into a lecture, ignoring their immediate hurt and anger.'
      ),
      AutomaticResponse(
        text: '"Stop yelling! Go to your room and calm down."',
        type: 'punishing',
          microfeedback: 'This punishes the child for having a big emotional reaction, sending the message that their anger is unacceptable.'
      ),
      AutomaticResponse(
        text: '"I\'ll just buy you a new one."',
        type: 'problem-solving',
          microfeedback: 'While it seems helpful, this response jumps to fixing the problem and misses the opportunity to connect with the child over their feelings of injustice and loss.'
      ),
    ],
    validationContent: ValidationContent(
        validationSentences: [
          'I could understand if you might feel angry at your sibling',
          'I can imagine you feel angry at your sibling',
          'No wonder you feel angry at your sibling',
          'It makes sense that you feel angry at your sibling',
          'I will never fully understand, but when I try to put myself in your shoes, I imagine you feel angry at your sibling',
          'When I try to see it from your perspective, I imagine you might feel angry at your sibling',
        ],
        becauseStatements: [
          'because that toy was special to you',
          'because it feels like this happens a lot',
          'because you want things to be fair',
          'because it\'s hard when you feel like nobody is on your side',
          'because it feels like your things aren\'t respected',
          'because you wanted to be able to play with your toy'
        ]),
    emotionalSupportOptions: [
      'Your anger makes complete sense to me.',
      'I\'m on your side, and I hear you.',
      'You\'re allowed to feel angry about this.',
      'I\'m here. You don\'t have to calm down right away.',
      'It\'s okay to have big feelings. I\'m not going anywhere.'
    ],
    practicalSupportOptions: [
      'Right now, I can just be here with you.',
      'When you\'re ready, we can talk about what happened.',
      'Would it help to have some space right now, or do you want to stay with me?'
    ],
  ),
  Scenario(
    id: 'bedtime-fear',
    title: 'Scared at Bedtime',
    childAge: '6 years old',
    emotionTag: 'Fear',
    situation:
        'At bedtime, your child refuses to go to sleep alone and becomes increasingly distressed, saying there are monsters.',
    childStatement:
        '"There\'s something in my room. I\'m too scared. Please don\'t leave me."',
    automaticResponses: [
       AutomaticResponse(
          text: '"There\'s nothing to be scared of. Monsters aren\'t real."', type: 'rationalising', microfeedback: 'Trying to reason a child out of a big feeling rarely works. Their fear is real to them, even if the monster isn\'t.' ),
      AutomaticResponse(
        text: '"You\'re being a baby. Big kids aren\'t scared of the dark."',
        type: 'shaming',
          microfeedback: 'This response shames the child for their fear, which can lead to them hiding their feelings from you in the future.'
      ),
      AutomaticResponse(
        text: '"If you don\'t stay in bed, I\'m taking away your tablet tomorrow."',
        type: 'threatening',
          microfeedback: 'Using threats and punishment adds more fear to an already scary situation and can damage your connection.'
      ),
      AutomaticResponse(
        text: '"I already checked the room. There is nothing there."',
        type: 'reassuring',
          microfeedback: 'While reassuring, this response can also be dismissive because it focuses on the facts, not the feeling of fear itself.'
      ),
    ],
    validationContent: ValidationContent(
        validationSentences: [
          'I could understand if you might feel scared at bedtime',
          'I can imagine you feel scared at bedtime',
          'No wonder you feel scared at bedtime',
          'It makes sense that you feel scared at bedtime',
          'I will never fully understand, but when I try to put myself in your shoes, I imagine you feel scared at bedtime',
          'When I try to see it from your perspective, I imagine you might feel scared at bedtime',
        ],
        becauseStatements: [
          'because the dark can feel big and scary',
          'because your imagination can be powerful at night',
          'because you need to know I\'m nearby',
          'because nighttime can sometimes feel lonely',
          'because it feels better when we\'re together',
          'because you want to feel safe and sound'
        ]),
    emotionalSupportOptions: [
      'I\'m right here. You\'re not alone.',
      'It\'s okay to feel scared. Your feelings are real.',
      'I\'ll stay close until you feel more settled.',
      'Your feelings make sense to me, and I\'m not going anywhere.',
      'Being scared at night is something a lot of children feel.'
    ],
    practicalSupportOptions: [
      'Right now, I can just be here with you.',
      'Would a nightlight help you feel safer?',
      'I can sit with you until you feel sleepy.',
      'Would you like to keep the door open a little?',
      'Let\'s think of something peaceful together to help you drift off.'
    ],
  ),
  // orginial from the silence script builder we made previously
  Scenario(
    id: 'silence-withdrawal',
    title: 'Going Quiet and Pulling Away',
    childAge: '12 years old',
    emotionTag: 'Silence',
    situation:
    'Your child comes home from school and goes straight to their room. When you check in, they barely respond and seem closed off. This has been happening more often lately.',
    childStatement:
    '"I don\'t want to talk about it. Just leave me alone."',
    automaticResponses: [
      AutomaticResponse(
        text: '"Why won\'t you just talk to me? I\'m your parent."',
        type: 'pressuring',
        microfeedback: 'Pushing for connection when a child is withdrawn can feel like pressure rather than support, and may make them retreat further.',
      ),
      AutomaticResponse(
        text: '"Fine, be that way. I\'ll just leave you alone then."',
        type: 'withdrawing',
        microfeedback: 'Matching withdrawal with withdrawal can confirm a child\'s fear that their silence pushes people away, rather than showing steady presence.',
      ),
      AutomaticResponse(
        text: '"You never tell me anything anymore. What is going on with you?"',
        type: 'interrogating',
        microfeedback: 'A flurry of questions can feel like an interrogation, increasing pressure on a child who may not yet have words for what they\'re feeling.',
      ),
      AutomaticResponse(
        text: '"It\'s probably just teenage moodiness. They\'ll grow out of it."',
        type: 'dismissing',
        microfeedback: 'Dismissing withdrawal as a phase can miss real underlying emotions like sadness, fear, or hopelessness that are asking for attention.',
      ),
    ],
    validationContent: ValidationContent(
        validationSentences: [
          'I could understand why you might not want to open up',
          'I can imagine you might not want to open up',
          'No wonder you might not want to open up',
          'It makes sense that you might not want to open up',
          'I will never fully understand, but when I try to put myself in your shoes, I imagine you might not want to open up',
          'When I try to see it from your perspective, I imagine you might not want to open up',
        ],
        becauseStatements: [
          'because you are a private person, and you may find it uncomfortable to talk about your feelings',
          'because it might be difficult to find the right words to describe what\'s going on',
          'because you might be worried that you\'ll end up feeling worse',
          'because we haven\'t always been in the habit of talking about the tough stuff',
          'because when we have talked about hard things, it hasn\'t always gone well',
          'because I\'ve had a tendency to jump in and try to fix things, which wasn\'t always so helpful'
        ]),
    emotionalSupportOptions: [
      'There is space for you to build trust with me.',
      'There is no pressure to engage right now, or ever.',
      'You can take the time you need.',
      'Your silence doesn\'t scare me or push me away.',
      'I will be there for you no matter what.'
    ],
    practicalSupportOptions: [
      'I\'m going to make some tea — would you like some?',
      'Do you want to watch something together, no talking necessary?',
      'I\'ll come back in an hour — no agenda, I just want you to know I\'m here.',
      'Right now, I can just be here with you.'
    ],
  ),
  // original content I wrote, not from the handout, since it has no scenario narratives.
  Scenario(
    id: 'silence-feeling-sad',
    title: 'Quiet Because of Sadness',
    childAge: '12 years old',
    emotionTag: 'Silence',
    situation:
    'Your child comes home from school and goes straight to their room. When you check in, they barely respond and seem closed off. This has been happening more often lately.',
    childStatement:
    '"I don\'t want to talk about it. Just leave me alone."',
    automaticResponses: [
      AutomaticResponse(
        text: '"Why won\'t you just talk to me? I\'m your parent."',
        type: 'pressuring',
        microfeedback: 'Pushing for connection when a child is withdrawn can feel like pressure rather than support, and may make them retreat further.',
      ),
      AutomaticResponse(
        text: '"Fine, be that way. I\'ll just leave you alone then."',
        type: 'withdrawing',
        microfeedback: 'Matching withdrawal with withdrawal can confirm a child\'s fear that their silence pushes people away, rather than showing steady presence.',
      ),
      AutomaticResponse(
        text: '"You never tell me anything anymore. What is going on with you?"',
        type: 'interrogating',
        microfeedback: 'A flurry of questions can feel like an interrogation, increasing pressure on a child who may not yet have words for what they\'re feeling.',
      ),
      AutomaticResponse(
        text: '"It\'s probably just teenage moodiness. They\'ll grow out of it."',
        type: 'dismissing',
        microfeedback: 'Dismissing withdrawal as a phase can miss real underlying emotions like sadness that are asking for attention.',
      ),
    ],
    validationContent: ValidationContent(
        validationSentences: [
          'I could understand if you might also feel sad underneath',
          'I can imagine you might also feel sad underneath',
          'No wonder you might also feel sad underneath',
          'It makes sense that you might also feel sad underneath',
          'I will never fully understand, but when I try to put myself in your shoes, I imagine you might also feel sad underneath',
          'When I try to see it from your perspective, I imagine you might also feel sad underneath',
        ],
        becauseStatements: [
          'because you\'re probably longing to be able to connect with somebody who really understands',
          'because it would be normal to want us to be able to connect with you in a way that feels easier',
          'because you may find it uncomfortable to talk about your feelings',
          'because it might be difficult to find the right words to describe what\'s going on',
          'because we haven\'t always been in the habit of talking about the tough stuff'
        ]),
    emotionalSupportOptions: [
      'There is space for you to build trust with me.',
      'There is no pressure to engage right now, or ever.',
      'You can take the time you need.',
      'Your silence doesn\'t scare me or push me away.',
      'I will be there for you no matter what.'
    ],
    practicalSupportOptions: [
      'I\'m going to make some tea — would you like some?',
      'Do you want to watch something together, no talking necessary?',
      'I\'ll come back in an hour — no agenda, I just want you to know I\'m here.'
    ],
  ),
  Scenario(
    id: 'silence-feeling-afraid',
    title: 'Quiet Because of Fear',
    childAge: '12 years old',
    emotionTag: 'Silence',
    situation:
    'Your child has been distant since something happened between you. When you try to talk, they shut the conversation down quickly and won\'t meet your eyes.',
    childStatement:
    '"It doesn\'t matter. You\'ll just be upset or it\'ll make things worse."',
    automaticResponses: [
      AutomaticResponse(
        text: '"I promise I won\'t be mad, just tell me."',
        type: 'reassuring',
        microfeedback: 'A quick promise can feel hollow to a child who has reason to doubt it — trust is rebuilt through consistent action, not a single line.',
      ),
      AutomaticResponse(
        text: '"You can\'t keep things from me forever."',
        type: 'pressuring',
        microfeedback: 'Framing openness as inevitable can increase a child\'s anxiety about being cornered rather than making space for them to choose to share.',
      ),
      AutomaticResponse(
        text: '"Fine, keep your secrets then."',
        type: 'withdrawing',
        microfeedback: 'Responding to fear-based silence with withdrawal can confirm the child\'s worry that opening up leads to disconnection.',
      ),
      AutomaticResponse(
        text: '"I already know what\'s wrong, you don\'t need to tell me."',
        type: 'assuming',
        microfeedback: 'Assuming you already understand can shut down the child\'s opportunity to be truly heard on their own terms.',
      ),
    ],
    validationContent: ValidationContent(
        validationSentences: [
          'I could understand if you might also feel afraid underneath',
          'I can imagine you might also feel afraid underneath',
          'No wonder you might also feel afraid underneath',
          'It makes sense that you might also feel afraid underneath',
          'I will never fully understand, but when I try to put myself in your shoes, I imagine you might also feel afraid underneath',
          'When I try to see it from your perspective, I imagine you might also feel afraid underneath',
        ],
        becauseStatements: [
          'because if you open up to me, you might worry that I could use it against you somehow',
          'because it might be too much for me, or I might fall apart',
          'because you might be worried that you\'ll end up feeling worse',
          'because I\'ve had a tendency to jump in and try to fix things, which wasn\'t always so helpful',
          'because it might be hard to imagine that I could understand where you\'re coming from'
        ]),
    emotionalSupportOptions: [
      'There is space for you to build trust with me.',
      'There is no pressure to engage right now, or ever.',
      'You can take the time you need.',
      'Your silence doesn\'t scare me or push me away.',
      'I will be there for you no matter what.'
    ],
    practicalSupportOptions: [
      'I\'m going to make some tea — would you like some?',
      'Do you want to watch something together, no talking necessary?',
      'I\'ll come back in an hour — no agenda, I just want you to know I\'m here.'
    ],
  ),
  Scenario(
    id: 'silence-feeling-hopeless',
    title: 'Quiet Because of Hopelessness',
    childAge: '13 years old',
    emotionTag: 'Silence',
    situation:
    'Your child used to tell you about their day, but lately they\'ve stopped trying. When you ask what\'s wrong, they just shrug and say it doesn\'t matter.',
    childStatement:
    '"What\'s the point of talking about it? Nothing changes anyway."',
    automaticResponses: [
      AutomaticResponse(
        text: '"That\'s not true, things can change if you just try."',
        type: 'rationalising',
        microfeedback: 'Correcting the child\'s belief outright can feel dismissive of the exhaustion behind it, rather than meeting them where they are.',
      ),
      AutomaticResponse(
        text: '"You used to talk to me all the time, what happened?"',
        type: 'guilt-tripping',
        microfeedback: 'Referencing how things used to be can unintentionally add guilt on top of an already heavy feeling of hopelessness.',
      ),
      AutomaticResponse(
        text: '"Well, suit yourself then."',
        type: 'withdrawing',
        microfeedback: 'Withdrawing in response can reinforce the belief that reaching out doesn\'t change anything, including the relationship itself.',
      ),
      AutomaticResponse(
        text: '"Let\'s just fix whatever is bothering you right now."',
        type: 'problem-solving',
        microfeedback: 'Jumping to solutions before validating the feeling can make a child who already feels unheard feel even more unseen.',
      ),
    ],
    validationContent: ValidationContent(
        validationSentences: [
          'I could understand if you might also feel hopeless underneath',
          'I can imagine you might also feel hopeless underneath',
          'No wonder you might also feel hopeless underneath',
          'It makes sense that you might also feel hopeless underneath',
          'I will never fully understand, but when I try to put myself in your shoes, I imagine you might also feel hopeless underneath',
          'When I try to see it from your perspective, I imagine you might also feel hopeless underneath',
        ],
        becauseStatements: [
          'because it might feel like there\'s no point in trying to let people know what\'s going on when it hasn\'t always felt worth it',
          'because you\'ve been trying so hard for so long',
          'because we haven\'t always been in the habit of talking about the tough stuff',
          'because when we have talked about hard things, it hasn\'t always gone well',
          'because we have some work to do to build a sense of safety and trust'
        ]),
    emotionalSupportOptions: [
      'There is space for you to build trust with me.',
      'There is no pressure to engage right now, or ever.',
      'You can take the time you need.',
      'Your silence doesn\'t scare me or push me away.',
      'I will be there for you no matter what.'
    ],
    practicalSupportOptions: [
      'I\'m going to make some tea — would you like some?',
      'Do you want to watch something together, no talking necessary?',
      'I\'ll come back in an hour — no agenda, I just want you to know I\'m here.'
    ],
  ),
  Scenario(
    id: 'silence-feeling-embarrassed',
    title: 'Quiet Because of Embarrassment',
    childAge: '11 years old',
    emotionTag: 'Silence',
    situation:
    'Something happened at school that your child won\'t discuss. They\'ve been avoiding conversations and seem to shrink away whenever the topic gets close.',
    childStatement:
    '"Can we just not talk about it? Please."',
    automaticResponses: [
      AutomaticResponse(
        text: '"Whatever it is, it can\'t be that bad."',
        type: 'minimizing',
        microfeedback: 'Minimizing the seriousness of what happened can deepen embarrassment by suggesting the child\'s reaction is an overreaction.',
      ),
      AutomaticResponse(
        text: '"I need to know what happened, I\'m your parent."',
        type: 'pressuring',
        microfeedback: 'Insisting on disclosure can increase the shame a child already feels about being seen, rather than easing it.',
      ),
      AutomaticResponse(
        text: '"Did you do something wrong?"',
        type: 'interrogating',
        microfeedback: 'A pointed question like this can feel accusatory, adding to a child\'s fear of being judged.',
      ),
      AutomaticResponse(
        text: '"Okay, we don\'t have to talk about it then. Ever."',
        type: 'avoiding',
        microfeedback: 'Avoiding the topic entirely can unintentionally signal that it\'s too uncomfortable or shameful to ever address, rather than leaving the door open.',
      ),
    ],
    validationContent: ValidationContent(
        validationSentences: [
          'I could understand if you might also feel embarrassed underneath',
          'I can imagine you might also feel embarrassed underneath',
          'No wonder you might also feel embarrassed underneath',
          'It makes sense that you might also feel embarrassed underneath',
          'I will never fully understand, but when I try to put myself in your shoes, I imagine you might also feel embarrassed underneath',
          'When I try to see it from your perspective, I imagine you might also feel embarrassed underneath',
        ],
        becauseStatements: [
          'because if you show us what\'s really going on, you might worry that we\'ll think you are broken',
          'because we\'ve said things that we now see could have made you feel judged or criticized',
          'because you are a private person, and you may find it uncomfortable to talk about your feelings',
          'because it might be difficult to find the right words to describe what\'s going on',
          'because I haven\'t always been there for you in the ways you\'ve needed, wanted, and deserved'
        ]),
    emotionalSupportOptions: [
      'There is space for you to build trust with me.',
      'There is no pressure to engage right now, or ever.',
      'You can take the time you need.',
      'Your silence doesn\'t scare me or push me away.',
      'I will be there for you no matter what.'
    ],
    practicalSupportOptions: [
      'I\'m going to make some tea — would you like some?',
      'Do you want to watch something together, no talking necessary?',
      'I\'ll come back in an hour — no agenda, I just want you to know I\'m here.'
    ],
  ),
  Scenario(
    id: 'silence-feeling-angry',
    title: 'Quiet Because of Anger',
    childAge: '13 years old',
    emotionTag: 'Silence',
    situation:
    'Your child has gone quiet after a disagreement at home. Instead of arguing back like they usually do, they\'ve completely stopped engaging and answer everything in one word.',
    childStatement:
    '"There\'s no point talking. You never actually listen anyway."',
    automaticResponses: [
      AutomaticResponse(
        text: '"That\'s not fair, I always listen to you."',
        type: 'defending',
        microfeedback: 'Defending yourself in the moment can shift focus away from the child\'s feeling and onto your own need to be understood.',
      ),
      AutomaticResponse(
        text: '"Fine, don\'t talk to me then, see if I care."',
        type: 'withdrawing',
        microfeedback: 'Matching the child\'s anger-driven silence with withdrawal of your own can confirm their belief that conflict leads to disconnection.',
      ),
      AutomaticResponse(
        text: '"You need to calm down before we can talk about this."',
        type: 'dismissing',
        microfeedback: 'Asking a child to manage their emotional state before being heard can feel like a condition placed on connection.',
      ),
      AutomaticResponse(
        text: '"I\'ll just decide what\'s best since you won\'t talk to me."',
        type: 'overriding',
        microfeedback: 'Taking over decisions in response to silence can reinforce the underlying anger about not feeling heard or included.',
      ),
    ],
    validationContent: ValidationContent(
        validationSentences: [
          'I could understand if you might also feel angry underneath',
          'I can imagine you might also feel angry underneath',
          'No wonder you might also feel angry underneath',
          'It makes sense that you might also feel angry underneath',
          'I will never fully understand, but when I try to put myself in your shoes, I imagine you might also feel angry underneath',
          'When I try to see it from your perspective, I imagine you might also feel angry underneath',
        ],
        becauseStatements: [
          'because so much of the focus has been on you when you know there\'s a bigger problem',
          'because you\'ve tried for so long to be heard or helped and we haven\'t yet figured out the way to be there for you',
          'because we haven\'t always been in the habit of talking about the tough stuff',
          'because I\'ve had a tendency to jump in and try to fix things, which wasn\'t always so helpful',
          'because I haven\'t always been there for you in the ways you\'ve needed, wanted, and deserved'
        ]),
    emotionalSupportOptions: [
      'There is space for you to build trust with me.',
      'There is no pressure to engage right now, or ever.',
      'You can take the time you need.',
      'Your silence doesn\'t scare me or push me away.',
      'I will be there for you no matter what.'
    ],
    practicalSupportOptions: [
      'I\'m going to make some tea — would you like some?',
      'Do you want to watch something together, no talking necessary?',
      'I\'ll come back in an hour — no agenda, I just want you to know I\'m here.'
    ],
  ),
];
