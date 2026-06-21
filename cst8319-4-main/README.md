# StressLess

A Flutter app that helps caregivers practice **validation and support** responses based on Emotion-Focused Family Therapy (EFFT).

## Overview

StressLess includes guided learning, practice sessions, a general script builder, and a script library with pre-written examples from client source documents.

| Tab | Purpose |
|-----|---------|
| **Home** | App introduction |
| **Learn** | Validation and Support framework content |
| **Practice** | Scenario-based practice sessions |
| **Build** | General custom script builder |
| **Library** | Pre-written Anger and Silence examples from client documents |
| **About** | App information |

## Script Library (Ren)

The **Script Library** is a separate screen from the general Script Builder. It provides ready-made validation and support scripts that caregivers can customize by selecting phrases from each step.

### Why it is separate from Script Builder

Per client review, the general **Build** tab is for creating scripts from scratch. **Library** holds emotion-specific examples (Anger, Silence) sourced from the client Word document—not mixed into the general builder.

### How it works

1. Open the **Library** tab.
2. Choose an **emotion** (Anger or Silence).
3. Choose a **scenario**.
4. Complete the script:
   - **Step 1 — Validation:** select exactly **3** "because" statements
   - **Step 2 — Emotional Support:** select at least 2 sentences
   - **Step 3 — Practical Support:** select up to 2 suggestions
5. The assembled script appears at the bottom as **Your Validation and Support Script**.
6. Tap **Copy Script** to copy the result.

### Included examples

| Emotion | Scenarios | Source |
|---------|-----------|--------|
| **Anger** | 6 (Feeling Misunderstood, Feeling Powerless, A Boundary Was Crossed, Feeling Overwhelmed, Old Hurts Coming Up, Angry at Themselves) | `EC_Scripts_Youth_Ages_8-12.revised.docx` → ANGER |
| **Silence** | 1 (When They Withdraw or Shut Down) | `EC_Scripts_Youth_Ages_8-12.revised.docx` → SHAME #5 |

Each example includes a `sourceReference` field pointing to the exact section in the client document.

### Key files

```
lib/
├── data/
│   └── script_library_data.dart       # Verbatim content from client docx
├── models/
│   └── script_library_example.dart    # Data model for library examples
└── screens/
    ├── script_library_screen.dart     # Library UI (emotion → scenario → build)
    └── script_builder_screen.dart     # General custom builder only
```

### Content policy

All Script Library wording comes **verbatim** from the client document (`EC_Scripts_Youth_Ages_8-12.revised.docx`). Do not replace or paraphrase with AI-generated text. When the client sends revised Word documents, update `script_library_data.dart` to match.

## Script Builder (Build tab)

The **Build** tab is the general-purpose script builder. Users pick sentence starters, verbs, because-statements, and support phrases to create a custom validation and support script from scratch. It does **not** include Anger or Silence library examples.

## Directory structure

```
.
├── lib/
│   ├── data/
│   │   ├── scenario_data.dart
│   │   └── script_library_data.dart
│   ├── models/
│   │   ├── models.dart
│   │   ├── script_library_example.dart
│   │   └── session.dart
│   ├── screens/
│   │   ├── main_screen.dart
│   │   ├── script_builder_screen.dart
│   │   ├── script_library_screen.dart
│   │   ├── script_screen.dart
│   │   ├── practice_screen.dart
│   │   ├── learn_screen.dart
│   │   └── steps/
│   ├── widgets/
│   ├── main.dart
│   └── theme.dart
├── pubspec.yaml
└── README.md
```

## Getting started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.x or later)
- Dart (included with Flutter)
- Android Studio / Xcode for device emulators (optional)

### Run locally

```bash
cd cst8319-4-main
flutter pub get
flutter run
```

### Analyze

```bash
flutter analyze
```

## Building for release

**Android:**

```bash
flutter build apk --release
```

Output: `build/app/outputs/apk/release/`

**iOS** (requires Apple Developer account):

```bash
flutter build ios --release
```

**Web:**

```bash
flutter build web
```

Output: `build/web/`

## Testing checklist

- [ ] App launches without errors
- [ ] Bottom navigation works across all tabs
- [ ] **Build** tab: custom script builder only (no Anger/Silence picker)
- [ ] **Library** tab: Anger and Silence scenarios load and assemble scripts
- [ ] Library requires 3 because-statements before showing a complete script
- [ ] Finish screen title reads **Your validation and support script** (Practice flow)
- [ ] Copy Script works in both Build and Library

## Team ownership

| Feature | Owner |
|---------|-------|
| Script Library (Anger) | Ren |
| Script Library (Silence) | Haleigh |
| General Script Builder | Team |
| Therapeutic Apology tab | Rachel |
| Navigation / integration | Ramona |
| App Store deployment research | Ren |

## Related documents

| Document | Use |
|----------|-----|
| `EC_Scripts_Youth_Ages_8-12.revised.docx` | Script Library content (Anger + Silence) |
| `TA.teaching.docx` | Therapeutic Apology tab (future) |
