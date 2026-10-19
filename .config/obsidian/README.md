# Shared Obsidian config

Obsidian settings shared across vaults and machines. This folder mirrors a vault's `.obsidian/` folder. Check a plugin's `data.json` for secrets before adding it.

## Link it into a vault

Symlink every file here except `README.md` to the same relative path under `<vault>/.obsidian/`. The shared copy replaces any existing file.

```sh
cd ~/.config/obsidian
find . -type f ! -name README.md | while read -r f; do
  mkdir -p "<vault>/.obsidian/$(dirname "$f")"
  ln -sfn "$PWD/${f#./}" "<vault>/.obsidian/${f#./}"
done
```

Then finish setup in the vault.

1. Create the daily notes folder set in `plugins/periodic-notes/data.json`. Daily note creation fails without it.
2. Open the vault and click "Trust author and enable plugins". Installed plugins turn on automatically.
3. Install any plugin from `community-plugins.json` that is missing.

## Check it worked

Settings changed in a linked vault write through the symlink, so they change the shared copy. If `ls -l <vault>/.obsidian/hotkeys.json` stops showing a symlink, Obsidian replaced it. Copy the file back here and use copies instead.

## BRAT plugins

These plugins are installed through BRAT. BRAT keeps its own list in `plugins/obsidian42-brat/data.json`, which is not shared. This is a copy, so update it when that list changes.

- `mattrossman/obsidian-clean-delete`
- `Ariestar/obsidian-dragger`
- `Amato21/nldates-revived`
