import sys
import xml.dom.minidom

fontsXmlFiles = [ 'SharedFonts.xml', 'Fonts.xml' ]

# all keys in lowercase
fontFileMap = {
	'fonts\\frizqt__.ttf': 'GlobalFont.DefaultFont',
	'fonts\\arialn.ttf': 'GlobalFont.ChatFont',
	'fonts\\morpheus.ttf': 'GlobalFont.ChatFont',
	'fonts\\skurri.ttf': 'GlobalFont.DefaultFont',
}

outlineMap = {
	'NORMAL': 'OUTLINE',
	'THICK': 'THICKOUTLINE',
}

def GetFontElements(fontFamily):
	members = fontFamily.getElementsByTagName('Member')
	return {
		member.getAttribute('alphabet'): member.getElementsByTagName('Font')[0]
		for member in members
	}

fixedSizedFonts = []

for file in fontsXmlFiles:
	dom = xml.dom.minidom.parse(file)
	fontFamilies = dom.documentElement.getElementsByTagName('FontFamily')
	for fontFamily in fontFamilies:
		name = fontFamily.getAttribute('name')
		fonts = GetFontElements(fontFamily)
		font = fonts['roman']

		if font.hasAttribute('fixedSize') and font.getAttribute('fixedSize') == "true":
			fixedSizedFonts += [ name ]
			continue

		fontFile = fontFileMap[font.getAttribute('font').lower()]
		fontSize = font.getAttribute('height')
		fontSizeChinese = fonts['simplifiedchinese'].getAttribute('height')

		flags = []
		if font.hasAttribute('outline'):
			flags += [ outlineMap[font.getAttribute('outline')] ]
		if font.hasAttribute('monochrome'):
			if font.getAttribute('monochrome') == 'true':
				flags += [ 'MONOCHROME' ]

		if flags:
			print('if {0} then {0}:SetFont({1}, GlobalFont.CalculateFontSize({2}, {3}), "{4}") end'.format(name, fontFile, fontSize, fontSizeChinese, ','.join(flags)))
		else:
			print('if {0} then {0}:SetFont({1}, GlobalFont.CalculateFontSize({2}, {3})) end'.format(name, fontFile, fontSize, fontSizeChinese))

if fixedSizedFonts:
	print('The following fonts has `fixedSize` attribute, handle them in xml file:', file = sys.stderr)
	print(fixedSizedFonts, file = sys.stderr)
