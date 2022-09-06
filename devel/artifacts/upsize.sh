#!/bin/bash
for i in *.png ; do
	w=`convert "$i" -print "%w\n" /dev/null`
	h=`convert "$i" -print "%h\n" /dev/null`
	#ratio=`python -c "import math; print( math.ceil( float(240) / float($w) ) )"`;
	ratio=`python -c "import math; print( 2**math.ceil(math.log2( float(240) / float($w) )) )"`;
	# 2**math.ceil(math.log2(x))
	waifu2x-ncnn-vulkan -i "$i" -o "${ratio}x_${i}" -s "$ratio" -n 2 
done
