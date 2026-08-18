# StressLess

A Flutter app that helps caregivers respond to children experiencing stress or distress, using validation and support techniques based on Emotion-Focused Family Therapy (EFFT).

## Overview

StressLess includes educational content, guided practice sessions, a general script builder, a script library of pre-written examples, and a therapeutic apology builder.

| Tab | Purpose |
|-----|---------|
| **Home** | App introduction, links to Support and Project Team |
| **Learn VS** | Validation and Support framework content; entry point to guided Practice and the Script Library |
| **Build VS** | General custom script builder |
| **Advanced** | Therapeutic Apology guide and 6-step builder |

The Script Library and guided Practice scenarios are not separate bottom-nav tabs — they're reached via buttons inside **Learn VS**.

## Script Library

The **Script Library** is separate from the general Script Builder. It provides ready-made validation and support scripts that caregivers customize by selecting phrases at each step.

### Why it is separate from Script Builder

Per client review, **Build VS** is for creating scripts from scratch. The Library holds emotion-specific examples sourced from the client Word document — not mixed into the general builder.

### How it works

1. From **Learn VS**, tap "Begin a practice session" or "continue practicing with emotion-based scenarios" to reach the Library.
2. Choose an **emotion** (Anger, Embarrassment, Hopelessness, Sadness, or Anxiety).
3. Choose a **scenario**.
4. Complete the script:
   - **Step 1 — Validation:** select the required "because" statements
   - **Step 2 — Emotional Support:** select at least 2 sentences
   - **Step 3 — Practical Support:** select up to 2 suggestions
5. The assembled script appears at the bottom as **Your Validation and Support Script**.
6. Tap **Copy Script** to copy the result.

### Included examples

| Emotion | Scenarios | Source |
|---------|-----------|--------|
| **Anger** | 6 | `EC_Scripts_Youth_Ages_8-12.revised.docx` → ANGER |
| **Embarrassment** (renamed from Shame; includes "When They Withdraw or Shut Down") | 15 | `EC_Scripts_Youth_Ages_8-12.revised.docx` → SHAME |
| **Hopelessness** | 6 | `EC_Scripts_Youth_Ages_8-12.revised.docx` → HOPELESSNESS |
| **Sadness** | 11 | `EC_Scripts_Youth_Ages_8-12.revised.docx` → SADNESS |
| **Anxiety** | 13 | `EC_Scripts_Youth_Ages_8-12.revised.docx` → ANXIETY |

51 scenarios total. Each example includes a `sourceReference` field pointing to the exact section in the client document.

### Content policy

All Script Library wording comes **verbatim** from the client document (`EC_Scripts_Youth_Ages_8-12.revised.docx`). Do not replace or paraphrase with AI-generated text. When the client sends revised Word documents, update `script_library_data.dart` to match.

## Script Builder (Build VS tab)

The general-purpose builder. Users pick a sentence starter, verb, feeling/action phrase, because-statements, and support phrases to create a custom validation and support script from scratch. It does not include the Library's emotion-specific examples.

## Practice

A guided 4-step flow (Automatic Response → Validation → Emotional Support → Practical Support) across four general scenarios, ending in an assembled script. Both Build VS and the Apology builder also include a **Practice Out Loud** feature to record and play back a spoken attempt.

> **Known limitation:** Practice Out Loud uses `path_provider`, which has no web implementation. It will fail with a `MissingPluginException` if run via `flutter run -d chrome`. Use an Android/iOS device, simulator, or desktop target instead.

## Therapeutic Apology (Advanced tab)

An educational guide followed by a 6-step guided builder for a structured therapeutic apology. Reachable from its own **Advanced** bottom-nav tab.

## App identity (store)

| | |
|--|--|
| Display name | StressLess |
| Bundle ID / Application ID | `com.stressless.app` |
| Apple ID for App Store Connect | `adele@dradelelafrance.com` |

Register this Bundle ID under Identifiers **before** creating the app in App Store Connect. Suggested in-app purchase product IDs (Consumable, reference name Contribute):

- `com.stressless.app.contribute.5`
- `com.stressless.app.contribute.10`
- `com.stressless.app.contribute.25`
- `com.stressless.app.contribute.50a`
- `com.stressless.app.contribute.100`

## Support this app

A **Contribute** screen reachable from Home ([issue #5](https://github.com/hnealon/Stressless/issues/5)). Amounts above $100 are not offered. The app stays free; Contribute does not unlock features. Copy uses “Contribute”, not “donate”.

### How it works

1. From **Home**, tap the Contribute card (the only entry point).
2. Choose one amount: **$5, $10, $25, $50, or $100**. Nothing is pre-selected.
3. Tap **Contribute**.
4. The App Store purchase sheet appears. **Thank you** is shown only after a confirmed purchase. Cancel or failure does not claim that money was received.

### Files

| File | Role |
|------|------|
| `lib/screens/home_screen_new.dart` | Home entry card |
| `lib/screens/support_app_screen.dart` | Amount chips and IAP purchase |
| `lib/iap/contribute_products.dart` | Product IDs |
| `ios/Runner/Contribute.storekit` | Local StoreKit products for the iOS Simulator |

### Testing

- **iOS Simulator:** Xcode scheme **Runner** uses `Contribute.storekit` (no real charge).
- **Physical iPhone:** Sandbox Apple ID after the app is signed with Adele’s team.
- **Chrome / web:** Store is unavailable; nothing is charged.

The first live In-App Purchase must be submitted for review together with an app version. Do not submit until TestFlight sandbox purchases succeed.

### How to try it

```bash
cd cst8319-4-main
flutter pub get
flutter run -d ios
```

Agree to the disclaimer → Home → Contribute. Pick an amount and complete or cancel the StoreKit sheet.

## Not included in this delivery

- **Interaction Log (SWF5)** — not implemented.
- App store distribution (Apple App Store / Google Play Store) — requested, but dropped due to timeline and lack of team Mac access for iOS signing.
- Google Play Billing for Contribute — iOS In-App Purchase is wired; Play products are not created yet.

## Directory structure
````
cst8319-4-main/ ← project root
├── android/
├── ios/
│ ├── Flutter/
│ └── Runner/
├── linux/
├── macos/
├── windows/
├── lib/
│ ├── data/
│ │ ├── scenario_data.dart
│ │ └── script_library_data.dart
│ ├── models/
│ │ ├── models.dart
│ │ └── script_library_example.dart
│ ├── screens/
│ │ ├── steps/
│ │ │ ├── step_automatic_response.dart
│ │ │ ├── step_emotional_support.dart
│ │ │ ├── step_knee_jerk_reaction.dart
│ │ │ ├── step_practical_support.dart
│ │ │ └── step_validation.dart
│ │ ├── about_screen.dart
│ │ ├── apology_guide_screen.dart
│ │ ├── apology_script_builder_screen.dart
│ │ ├── home_screen_new.dart
│ │ ├── learn_screen.dart
│ │ ├── main_screen.dart
│ │ ├── practice_screen.dart
│ │ ├── scenario_list_screen.dart
│ │ ├── script_builder_screen.dart
│ │ ├── script_library_screen.dart
│ │ ├── script_screen.dart
│ │ ├── session_screen.dart
│ │ └── support_app_screen.dart
│ ├── widgets/
│ │ └── shared_widgets.dart
│ ├── main.dart
│ └── theme.dart
├── test/
├── tools/
├── web/
├── .gitignore
├── .metadata
└── pubspec.yaml
````

## Getting started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.x or later)
- Dart (included with Flutter)
- Xcode (for iOS) and/or Android Studio (for Android)

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


## Handoff note

This project is delivered as final source code, not a store-published app. See the included handoff instructions for running it locally on a Mac via Xcode/Flutter — no signed release build or app store account is required.

## Team ownership

| Feature                             | Owner          |
|-------------------------------------|----------------|
| Script Library                      | Ren            |
| General Script Builder              | Haleigh        |
| Practice Out Loud (audio recording) | kalil          |
| Therapeutic Apology tab             | Gohar & Rachel |
| Navigation / integration / Home     | Ramona         |

## Related documents

| Document | Use |
|----------|-----|
| `EC_Scripts_Youth_Ages_8-12.revised.docx` | Script Library content |