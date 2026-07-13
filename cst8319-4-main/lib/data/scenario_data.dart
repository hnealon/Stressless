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


];
