"""Generate Dart ScriptLibraryExample entries from client docx."""
import re
import zipfile
import xml.etree.ElementTree as ET

DOCX = r"C:\Users\Renyo\Downloads\EC_Scripts_Youth_Ages_8-12.revised.docx"
EMOTIONS = {
    "HOPELESSNESS": "Hopelessness",
    "SADNESS": "Sadness",
    "ANXIETY": "Anxiety",
}


def extract_paragraphs(path: str) -> list[str]:
    with zipfile.ZipFile(path) as z:
        xml = z.read("word/document.xml")
    root = ET.fromstring(xml)
    w = "{http://schemas.openxmlformats.org/wordprocessingml/2006/main}"
    paras = []
    for p in root.iter(w + "p"):
        texts = [t.text for t in p.iter(w + "t") if t.text]
        if texts:
            paras.append("".join(texts))
    return paras


def slugify(title: str) -> str:
    s = title.lower()
    s = re.sub(r"[^a-z0-9]+", "-", s)
    return s.strip("-")


def dart_str(s: str) -> str:
    return "'" + s.replace("\\", "\\\\").replace("'", "\\'") + "'"


def is_skip(line: str) -> bool:
    return line in (
        "Validation & Support Scripts",
        "VALIDATION",
        "EMOTIONAL SUPPORT",
        "PRACTICAL SUPPORT",
    ) or line.startswith("Choose ")


def next_meaningful(paras: list[str], i: int) -> str | None:
    j = i + 1
    while j < len(paras):
        line = paras[j].strip()
        if line:
            return line
        j += 1
    return None


def parse_emotions(paras: list[str]) -> dict[str, list[dict]]:
    sections: dict[str, list[dict]] = {}
    current: str | None = None
    scenario: dict | None = None
    block: str | None = None

    def flush():
        nonlocal scenario
        if current in EMOTIONS and scenario and scenario["opener"]:
            sections.setdefault(current, []).append(scenario)
        scenario = None

    i = 0
    while i < len(paras):
        line = paras[i].strip()
        i += 1
        if not line:
            continue

        if line in EMOTIONS:
            flush()
            current = line
            block = None
            continue
        if current not in EMOTIONS or is_skip(line):
            if line == "VALIDATION" and scenario:
                block = "validation"
            elif line == "EMOTIONAL SUPPORT":
                block = "emotional"
            elif line == "PRACTICAL SUPPORT":
                block = "practical"
            continue

        m = re.match(r"^(\d+)\.\s+(.+)$", line)
        if m:
            flush()
            scenario = {
                "num": m.group(1),
                "title": m.group(2).strip(),
                "opener": None,
                "because": [],
                "emotional": [],
                "practical": [],
            }
            block = None
            continue

        if not scenario:
            continue

        if line.startswith("because "):
            scenario["because"].append(line)
            block = "because"
            continue

        nxt = next_meaningful(paras, i - 1)
        if (
            block in ("practical", "because", "emotional")
            and nxt == "VALIDATION"
            and not line.startswith("because")
        ):
            flush()
            scenario = {
                "num": "3" if line == "Feeling Left Out or Unseen" else "?",
                "title": line,
                "opener": None,
                "because": [],
                "emotional": [],
                "practical": [],
            }
            block = None
            continue

        if block == "validation" and scenario["opener"] is None:
            scenario["opener"] = line
            continue

        if block == "emotional":
            scenario["emotional"].append(line)
            continue

        if block == "practical":
            scenario["practical"].append(line)
            continue

    flush()
    return sections


def render_entry(emo_key: str, s: dict) -> str:
    emo_label = EMOTIONS[emo_key]
    emo_slug = emo_label.lower()
    sid = f"{emo_slug}-{slugify(s['title'])}"
    ref = (
        f"$kScriptLibrarySourceDocument → {emo_key} → "
        f"{s['num']}. {s['title']}"
    )
    lines = [
        "  ScriptLibraryExample(",
        f"    id: {dart_str(sid)},",
        f"    emotion: {dart_str(emo_label)},",
        f"    title: {dart_str(s['title'])},",
        f"    sourceReference: {dart_str(ref)},",
        f"    validationOpener: {dart_str(s['opener'])},",
        "    becauseStatements: [",
    ]
    for b in s["because"]:
        lines.append(f"      {dart_str(b)},")
    lines.append("    ],")
    lines.append("    emotionalSupport: [")
    for e in s["emotional"]:
        lines.append(f"      {dart_str(e)},")
    lines.append("    ],")
    lines.append("    practicalSupport: [")
    for p in s["practical"]:
        lines.append(f"      {dart_str(p)},")
    lines.append("    ],")
    lines.append("  ),")
    return "\n".join(lines)


def main():
    paras = extract_paragraphs(DOCX)
    sections = parse_emotions(paras)
    out = []
    for key in ("HOPELESSNESS", "SADNESS", "ANXIETY"):
        for s in sections.get(key, []):
            out.append(render_entry(key, s))
            print(
                f"OK {key} {s['num']} {s['title']}: "
                f"b={len(s['because'])} e={len(s['emotional'])} p={len(s['practical'])}"
            )
    path = r"C:\Users\Renyo\StudioProjects\Stressless\cst8319-4-main\tools\generated_emotions.dart.txt"
    with open(path, "w", encoding="utf-8") as f:
        f.write("\n".join(out))
    print(f"Wrote {len(out)} scenarios to {path}")


if __name__ == "__main__":
    main()
