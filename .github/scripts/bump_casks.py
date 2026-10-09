#!/usr/bin/env python3
"""Bump every Sparkle cask in Casks/ to the newest version in its appcast."""
import hashlib
import pathlib
import re
import sys
import urllib.request
import xml.etree.ElementTree as ET

SPARKLE = "{http://www.andymatuschak.org/xml-namespaces/sparkle}"


def fetch(url):
    with urllib.request.urlopen(url, timeout=120) as r:
        return r.read()


def latest(appcast_url):
    items = ET.fromstring(fetch(appcast_url)).iter("item")

    def build(item):
        return int(item.findtext(f"{SPARKLE}version") or item.find("enclosure").get(f"{SPARKLE}version"))

    item = max(items, key=build)
    enclosure = item.find("enclosure")
    short = item.findtext(f"{SPARKLE}shortVersionString") or enclosure.get(f"{SPARKLE}shortVersionString")
    return short, enclosure.get("url")


def bump(path):
    text = path.read_text()
    if "strategy :sparkle" not in text:
        return False
    current = re.search(r'^  version "([^"]+)"', text, re.M).group(1)
    url_template = re.search(r'^  url "([^"]+)"', text, re.M).group(1)
    appcast = re.search(r'^    url "([^"]+)"', text, re.M).group(1)

    version, download = latest(appcast)
    if version == current:
        print(f"{path.stem}: {current} is current")
        return False
    expected = url_template.replace("#{version}", version)
    if download != expected:
        sys.exit(f"{path.stem}: appcast url {download} does not match cask url {expected}")

    sha = hashlib.sha256(fetch(download)).hexdigest()
    text = re.sub(r'^  version "[^"]+"', f'  version "{version}"', text, count=1, flags=re.M)
    text = re.sub(r'^  sha256 "[^"]+"', f'  sha256 "{sha}"', text, count=1, flags=re.M)
    path.write_text(text)
    print(f"{path.stem}: {current} -> {version}")
    return True


if __name__ == "__main__":
    root = pathlib.Path(sys.argv[1] if len(sys.argv) > 1 else ".")
    for cask in sorted((root / "Casks").glob("*.rb")):
        bump(cask)
