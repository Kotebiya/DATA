# http://stackoverflow.com/a/19602990
import urllib

# ST = ["al","ak","az","ar","ca","co","ct","de","fl","ga","hi","id","il","in","ia","ks","ky","la","me","md","ma","mi","mn","ms","mo","mt","ne","nv","nh","nj","nm","ny","nc","nd","oh","ok","or","pa","ri","sc","sd","tn","tx","ut","vt","va","wa","wv","wi","wy","dc"]
ST = ["al","ak","az","ar","ca","co","ct","de","fl","ga","hi","id","il","in","ia","ks","ky","la","me","md","ma","mi","mn","ms","mo","mt","ne","nv","nh","nj","nm","ny","nc","nd","oh","ok","or","pa","ri","sc","sd","tn","tx","ut","vt","va","wa","wv","wi","dc"]
YEAR = ["2014"]
# Since there is no 2014 for Wyoming, I use the 2013 data instead.
ST2 = ["wy"]
YEAR2 = ["2013"]

download = urllib.URLopener()
httpdir = "http://lehd.ces.census.gov/data/lodes/LODES7/"
# Don't forget to replace all instances / or \ in a local directory with a // as shown below.
localdir = "C://Users//MainUser//Downloads//DATA//Census//LEHD//"

for STABB in ST1:
    for YR in YEAR:
        print "Downloading the " + YR + " File for " + STABB + "."
        download.retrieve( httpdir + STABB + "/wac/" + STABB + "_wac_S000_JT00_" + YR + ".csv.gz",
                           localdir + STABB + "_wac_S000_JT00_" + YR + ".csv.gz")
for STABB in ST2:
    for YR in YEAR2:
        print "Downloading the " + YR + " File for " + STABB + "."
        download.retrieve( httpdir + STABB + "/wac/" + STABB + "_wac_S000_JT00_" + YR + ".csv.gz",
                           localdir + STABB + "_wac_S000_JT00_" + YR + ".csv.gz")

