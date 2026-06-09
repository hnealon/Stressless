# Blueprint: Parent-Child Communication App

## Overview

This document outlines the design, features, and structure of a Flutter application aimed at helping parents improve their communication with their children during emotionally charged moments. The app provides a learning hub, guided practice scenarios, and a script-building tool to teach and reinforce the core skill of emotional validation.

## Core Concepts & Features

The app is built around a central theme: teaching parents to validate their child's feelings before offering support or solutions. This is achieved through three main tabs: Learn, Practice, and Script Builder.

### 1. The Learn Hub (`learn_screen.dart`)

This is the educational core of the app. It breaks down the communication framework into clear, digestible topics.

- **Core Principle:** The primary lesson is the **Validation + Support** model.
- **Validation Framework:** The app teaches a 4-part structure for crafting a validation sentence:
    1.  **Sentence Starter:** A phrase that shows you are trying to understand.
    2.  **Verb:** A word to label the internal experience (feel, think, want).
    3.  **Feeling/Action Phrase:** A description of the specific emotion, thought, or urge.
    4.  **"Because" Statement:** A reason that explains *why* the feeling/thought/want makes sense from the child's perspective.
- **Taught Starters & Verbs:** The following options are explicitly taught and are used consistently across the app:
    -   **Starters:**
        -   `I could understand if you`
        -   `I can imagine you`
        -   `No wonder you`
        -   `It makes sense that you`
        -   `I will never fully understand, but when I try to put myself in your shoes, I imagine you`
        -   `When I try to see it from your perspective, I imagine you`
    -   **Verbs:**
        -   `feel`
        -   `think`
        -   `want`
        -   `don't want to`
        -   `might not want to`
- **Support Types:** The app distinguishes between **Emotional Support** (offering presence and warmth) and **Practical Support** (offering solutions or help).

### 2. Guided Practice Scenarios (`practice_screen.dart`)

This section allows users to apply the learned concepts in simulated situations.

- **Structure:** Users select a scenario (e.g., "Worried About a Test," "Left Out by Friends") and are guided through a 5-step process:
    1.  **Awareness:** Identify and reflect on their initial, automatic reaction.
    2.  **Validation:** Build a validation sentence using the 4-part framework. The choices provided for starters and verbs are standardized to match the Learn Hub.
    3.  **Emotional Support:** Choose statements that offer comfort and presence.
    4.  **Practical Support:** Choose an offer of help or decide that none is needed.
    5.  **Reflection:** Review their constructed script and reflect on their emotional state.
- **Interactive UI:** The UI is designed to be a step-by-step wizard, making the process clear and manageable.

### 3. The Script Builder (`script_builder_screen.dart`)

This is a free-form tool for creating custom validation scripts from scratch, perfect for real-life situations.

- **Structure:** The builder provides a guided interface that mirrors the 4-part validation framework and support steps.
- **Key Features:**
    -   **Choice Chips:** Users select a sentence starter and a verb.
    -   **Dedicated Phrase Field:** A text input field allows the user to write a custom **Feeling/Action Phrase** to complete the verb, signaled by a `...` on the verb chips.
    -   **"Because" Inputs:** Three text fields for adding explanatory "because" statements.
    -   **Support Options:** Choice chips for adding emotional and practical support phrases.
    -   **Live Script Generation:** A preview area at the bottom shows the complete script as it's being built.
    -   **Copy to Clipboard:** A button to easily copy the final script for use in messaging apps or for personal notes.

## Application Design & Style (`theme.dart`)

- **Aesthetic:** Modern, clean, and intuitive. The design uses a soft color palette, rounded corners, and clear typography to create a calming and encouraging user experience.
- **Fonts:** `GoogleFonts.nunito` for body text and UI elements, and `GoogleFonts.cormorantGaramond` for headings to create a warm, approachable, and premium feel.
- **Color Palette:** A primary color of `AppColors.primary` (a soft purple), with supporting shades for surfaces, text, and accents.
- **Widgets:** The app relies on custom-styled, reusable widgets like `SelectableOptionTile` and `SessionNavButtons` to ensure a consistent look and feel.

## Data Structure (`lib/models/models.dart`)

The application's data is structured around two primary models:

1.  **`Scenario`**: Represents a complete practice scenario.
    -   `id`: Unique identifier.
    -   `title`, `childAge`, `situation`, `childStatement`, `emotionTag`: Descriptive strings.
    -   `automaticResponses`: A list of `AutomaticResponse` objects.
    -   `validationContent`: A `ValidationContent` object containing the building blocks for the validation step.
    -   `emotionalSupportOptions`, `practicalSupportOptions`, `reflectionEmotions`: Lists of strings.

2.  **`ValidationContent`**: Holds the specific options for building a validation sentence.
    -   `starters`: `List<String>`
    -   `verbs`: `List<String>`
    -   `phrases`: `List<String>` (rewritten to logically follow the verbs).
    -   `becauseStatements`: `List<String>`

3.  **`SessionState`**: Manages the user's progress and choices within a single practice session.

## Scenario Content Example (`lib/data/scenario_data.dart`)

Here is an example of the updated data structure for a single scenario, demonstrating the standardized starters/verbs and the refined phrases.

```dart
Scenario(
  id: 'test-anxiety',
  title: 'Worried About a Test',
  childAge: '9 years old',
  emotionTag: 'Anxiety',
  situation: 'Your child comes home from school looking upset. They just found out they have a big math test tomorrow.',
  childStatement: '"I can\'t do this. I\'m going to fail and everyone will laugh at me."',
  automaticResponses: [ /* ... */ ],
  validationContent: ValidationContent(
    starters: [
      'I could understand if you',
      'I can imagine you',
      // ... and other standard starters
    ],
    verbs: ['feel', 'think', 'want', 'don\'t want to', 'might not want to'],
    phrases: [
      'really anxious and overwhelmed right now',      // For "feel"
      'that you\'re going to fail and everyone will laugh', // For "think"
      'to just forget about this test completely',    // For "want"
      'a lot of pressure to do well'                   // For "feel"
    ],
    becauseStatements: [
      'because you want to do well and it\'s important to you',
      'because this test feels like a really big deal',
      // ... etc.
    ]
  ),
  emotionalSupportOptions: [ /* ... */ ],
  practicalSupportOptions: [ /* ... */ ],
  reflectionEmotions: [],
)
```

## Current Plan: Blueprint Update

-   **Action:** This blueprint has been rewritten from the ground up.
-   **Reason:** To reflect the significant recent changes, including:
    1.  The refactoring of the `ValidationContent` model.
    2.  The standardization of `starters` and `verbs` across all scenarios to align with the `learn_screen`.
    3.  The refinement of `phrases` to create logical sentence construction.
    4.  The major functional and UI improvements to the `script_builder_screen`, including the addition of the "Feeling/Action Phrase" text field.
-   **Status:** Complete. This document now serves as an accurate, up-to-date guide to the application's architecture and features.
