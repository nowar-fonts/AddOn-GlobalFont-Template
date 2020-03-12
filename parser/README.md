# Fonts.xml Parser

This is a simple script that parses WoW’s Fonts.xml files (`Interface\SharedXML\SharedFonts.xml` and `Interface\FrameXML\Fonts.xml`) and generates lua code.

## Usage

Get Fonts.xml files from [tomrus88/BlizzardInterfaceCode repo](https://github.com/tomrus88/BlizzardInterfaceCode) or [extract them from the game](https://wowwiki.fandom.com/wiki/Extracting_WoW_user_interface_files), and then put these files here.

Run
```bash
python parser.py >Fonts.lua
```
