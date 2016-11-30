#! /usr/bin/python
import sys

if len(sys.argv)<2 or ".ccss"  not in sys.argv[1]:
    sys.exit("Something went wrong. Make sure you specify a file and it is a ccss file")

ccssfile = open(sys.argv[1], 'r')
ccsstrings = ccssfile.read()
splitstrings = ccsstrings.split("\n")
splitstrings = filter(None, splitstrings)
ccsstrings = ccsstrings[ccsstrings.index(splitstrings[1]):]
ccssfile.close()

themeloc = splitstrings[0][8:splitstrings[0].index("m__")+1]
themefile = open(themeloc, "r")
themestrings = themefile.read().strip().split("\n")
themefile.close()

themedict = {}
for var in themestrings:
    themedict[var[:var.index(":")]] = "#" + var[var.index(":")+1:][3:]

for theme in themedict:
    print "%"+theme+"%" + " --> " + themedict[theme]
    ccsstrings = ccsstrings.replace("%"+theme+"%", themedict[theme])

outfile = sys.argv[1][:sys.argv[1].index(".ccss")]+".css"
outfile = open(outfile, "w")
outfile.write(ccsstrings)
outfile.close()
