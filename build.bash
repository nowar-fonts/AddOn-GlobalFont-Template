# Usage:
#   bash build.bash <interface>
#
# e.g.
#   bash build.bash 80300

edition=(Std Pro)
declare -A familyName=([Std]=WarSans [Pro]=NowarSans)

weight=(W2 W3 W4 W6)
declare -A normalStyle=([W2]=Light [W3]=Regular [W4]=Medium [W6]=Bold)
declare -A condStyle=([W2]=CondensedLight [W3]=Condensed [W4]=CondensedMedium [W6]=CondensedBold)
declare -A extStyle=([W2]=ExtendedLight [W3]=Extended [W4]=ExtendedMedium [W6]=ExtendedBold)

rm -r build/ out/
mkdir -p out/7z
mkdir -p out/zip

v=$(cat $1/\!GlobalFont_Template/\!GlobalFont_Template.toc | grep "## Version" | cut -d\  -f3)
for e in ${edition[@]}
do
	fontver=$(cat font/$e/version)
	family=${familyName[$e]}
	for w in ${weight[@]}
	do
		normal=${normalStyle[$w]}
		cond=${condStyle[$w]}
		ext=${extStyle[$w]}

		mkdir -p build/$1/\!GlobalFont_$e$w
		cp $1/\!GlobalFont_Template/\!GlobalFont_Template.toc build/$1/\!GlobalFont_$e$w/\!GlobalFont_$e$w.toc
		sed -i "s/__REPLACE_IN_BUILD__ADDON_NAME__/Global Font ($e $w)/" build/$1/\!GlobalFont_$e$w/\!GlobalFont_$e$w.toc
		sed -i "s/Version: $v/Version: $v+$fontver/" build/$1/\!GlobalFont_$e$w/\!GlobalFont_$e$w.toc

		cp $1/\!GlobalFont_Template/{Core.lua,FixedSize.xml,LibStub.lua,SharedMedia.lua} build/$1/\!GlobalFont_$e$w/

		cp font/$e/$family-CL,UI-$ext.otf build/$1/\!GlobalFont_$e$w/
		cp font/$e/$family-CL,UI-$cond.otf build/$1/\!GlobalFont_$e$w/
		cp font/$e/$family-CN-$normal.otf build/$1/\!GlobalFont_$e$w/
		cp font/$e/$family-CN-$cond.otf build/$1/\!GlobalFont_$e$w/
		cp font/$e/$family-TW-$normal.otf build/$1/\!GlobalFont_$e$w/
		cp font/$e/$family-TW-$cond.otf build/$1/\!GlobalFont_$e$w/

		# escaped twice by bash and sed
		sed -i "s/__REPLACE_IN_BUILD__EDITION_ID__/$e$w/" build/$1/\!GlobalFont_$e$w/FixedSize.xml
		sed -i "s/__REPLACE_IN_BUILD__DEFAULT_FONT_WESTERN__/Interface\\\\AddOns\\\\!GlobalFont_$e$w\\\\$family-CL,UI-$ext.otf/" build/$1/\!GlobalFont_$e$w/Core.lua build/$1/\!GlobalFont_$e$w/FixedSize.xml
		sed -i "s/__REPLACE_IN_BUILD__CHAT_FONT_WESTERN__/Interface\\\\AddOns\\\\!GlobalFont_$e$w\\\\$family-CL,UI-$cond.otf/" build/$1/\!GlobalFont_$e$w/Core.lua
		sed -i "s/__REPLACE_IN_BUILD__DEFAULT_FONT_ZHCN__/Interface\\\\AddOns\\\\!GlobalFont_$e$w\\\\$family-CN-$normal.otf/" build/$1/\!GlobalFont_$e$w/Core.lua build/$1/\!GlobalFont_$e$w/FixedSize.xml
		sed -i "s/__REPLACE_IN_BUILD__CHAT_FONT_ZHCN__/Interface\\\\AddOns\\\\!GlobalFont_$e$w\\\\$family-CN-$cond.otf/" build/$1/\!GlobalFont_$e$w/Core.lua
		sed -i "s/__REPLACE_IN_BUILD__DEFAULT_FONT_ZHTW__/Interface\\\\AddOns\\\\!GlobalFont_$e$w\\\\$family-TW-$normal.otf/" build/$1/\!GlobalFont_$e$w/Core.lua build/$1/\!GlobalFont_$e$w/FixedSize.xml
		sed -i "s/__REPLACE_IN_BUILD__CHAT_FONT_ZHTW__/Interface\\\\AddOns\\\\!GlobalFont_$e$w\\\\$family-TW-$cond.otf/" build/$1/\!GlobalFont_$e$w/Core.lua

		cd build/$1
		7z a -t7z -m0=LZMA:d=32m:fb=273 -ms=on ../../out/7z/GlobalFont_$e${w}_$v+$fontver.7z \!GlobalFont_$e$w &
		7z a -tzip -mm=Deflate:fb=258:pass=3 -mcu=on ../../out/zip/GlobalFont_$e${w}_$v+$fontver.zip \!GlobalFont_$e$w &
		cd ../..
	done
done
