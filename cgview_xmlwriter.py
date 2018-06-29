#take the bed output of Mitos2 and make it a cgview input xml file        
bedinput="s30.bed"
sequencelength=18000 # length of the genome ( in bp)
outputfile="test.xml"



##CLASS and function

class featureSlot(object):
	""" a class to define genomic interval to plot with cgview. 
  	<featureSlot strand="direct">
    <feature color="green" decoration="clockwise-arrow" label="a promoter">
      <featureRange start="500" stop="900" />
    </feature>
  	</featureSlot>
	""" 
	def __init__ (self,start,stop,label,strand="direct",color="auto"):
		self.seq=seq
		self.start=int(start)
		self.stop=stop
		self.strand=strand
		self.label=label
		self.color=color
		if self.strand=="+":
			self.strand="direct"
		elif self.strand=="-":
			self.strand="reverse"
		# clockwise anticlockwise
		if self.strand=="direct":
			self.decoration="clockwise-arrow"
		elif self.strand=="reverse":
			self.decoration="counterclockwise-arrow"
		#quick color scheme
		if color=="auto":
			if "trn" in self.label:
				self.color="blue"
			elif "rrn" in self.label:
				self.color="green"
			else:
				self.color="red"
	def __repr__(self):
		return repr("    ".join([str(self.seq),str(self.start),str(self.stop),str(self.label),str(self.color)]))
	def write(self,fileconnection):
		"write the feature to a standard open file connection"		
		fileconnection.write('\n    <feature color="%s" decoration="%s" label="%s">\n      <featureRange start="%s" stop="%s" />\n    </feature>\n ' %(self.color,self.decoration,self.label,self.start,self.stop))

##main
output=open(outputfile,"w")
output.write('<?xml version="1.0" encoding="ISO-8859-1"?>\n<cgview labelPlacementQuality="best" backboneRadius="160" sequenceLength="%i" height="600" width="600">\n' %(sequencelength))

#read all the features
allfeatures=[]
with open(bedinput) as f:
	for line in f:
		seq,start,stop,genename,ID,strandinfo=line.strip().split("\t")
		allfeatures.append(featureSlot(start,stop,label=genename,strand=strandinfo,color="auto"))
		
output.write('<featureSlot strand="direct">\n')
for feature in allfeatures:
	if feature.strand=="direct":
		feature.write(output)
output.write('</featureSlot>\n')

output.write('<featureSlot strand="reverse">\n')
for feature in allfeatures:
	if feature.strand=="reverse":
		feature.write(output)
output.write('</featureSlot>\n')

#go through features with some rules:

output.write("</cgview>")

output.close()


#then cgview can be run as ( adjust paths) :
!java -jar cgview/cgview.jar -i test.xml -o test.png