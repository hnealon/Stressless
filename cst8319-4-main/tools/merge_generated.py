from pathlib import Path

base = Path(__file__).resolve().parent.parent / "lib/data/script_library_data.dart"
gen = Path(__file__).resolve().parent / "generated_emotions.dart.txt"

text = base.read_text(encoding="utf-8")
generated = gen.read_text(encoding="utf-8").rstrip() + "\n"

if "hopelessness-nothing-will-ever-change" in text:
    print("Already merged")
else:
    marker = "  ),\n];"
    if marker not in text:
        raise SystemExit("marker not found in script_library_data.dart")
    text = text.replace(marker, "  ),\n" + generated + "];", 1)
    base.write_text(text, encoding="utf-8")
    print("Merged successfully")

emotions = sorted(
    {
        line.split("'")[1]
        for line in text.splitlines()
        if "emotion: '" in line
    }
)
print(f"Lines: {len(text.splitlines())}")
print(f"Scenarios: {text.count('ScriptLibraryExample(')}")
print(f"Emotions: {emotions}")
