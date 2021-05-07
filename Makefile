#
# File Name Makefile
# By Evan Foss
# Date 2010.05.07
# Project 
#
# Description
# 
#
# Requirements
#
#

#Project Name
NAME = bioamp
#Project Schematics
SCHEMATICS = bioamp.sch twinax_doc.sch notchfilter.sch rackpower.sch
#Project Netlists
NETLISTS = $(NAME).net
#Project SPICE Simulation Data
SPICEDATA = $(NAME).dat
#Project SPICE Data to Graph
SPICEGRAPH = $(NAME)SPICE.csv
#Project GNUCAP Simulation Data

#Project GNUCAP Data to Graph

#Project Graphing Programs
GRAPHCMDFILE_GNUPLOT = plot.gnu
#Project Schematics to PCB File
SCH2PCB = project.lht
#Project Printed Circuit Boards
PCBS = bioamp-art.lht
#Project Gerbers
GERBERS = $(NAME)-art.fab.gbr $(NAME)-art.plated-drill.cnc $(NAME)-art.frontsilk.gbr $(NAME)-art.front.gbr $(NAME)-art.frontmask.gbr $(NAME)-art.back.gbr  $(NAME)-art.backmask.gbr

#
## Text Editor
TEXTEDITOR = vi
#
## Math Tool (you still have to type notebook() after this starts though)
MATHTOOL = sage
MATHFLAGS = 
#
## Schematic Capture
SCHTOOL = lepton-schematic
SCHFLAGS = -q
#
## Schematic Library
SCHLIB = gschlas
SCHLIBFLAGS = -e
#
## Simulation Tool
SIMTOOL = ngspice
SIMFLAGS = -n -b
#
## Netlist Generator
NETTOOL = lepton-netlist
NETFLAGS = -g spice-sdb -o 
NETDRC = -g drc2 -o drcerrors-tmp.text
#
## Graphing Tool
GRAPHTOOL_GNUPLOT = gnuplot
GRAPHFLAGS_GNUPLOT = -persist
#
## Schematic to PCB Tool
SCH2PCB_TOOL = gsch2pcb-rnd
SCH2PCB_FLAGS = -m import
# 
## PCB Tool
PCBTOOL = pcb-rnd
#
## Gerber Viewer
PCBVIEW = gerbv
#
## BOM Generation tool
BOMTOOL = pcb
BOMFLAGS = -x bom


all:
	$(TEXTEDITOR) Makefile

change:
	$(SCHTOOL) $(SCHFLAGS)  $(SCHEMATICS)

simulation:
	$(NETTOOL) $(NETFLAGS) $(NETLISTS) $(SCHEMATICS1) $(SCHEMATICS2)
	cat $(NETLISTS)
	$(SIMTOOL) $(SIMFLAGS) $(NETLISTS) -o $(SPICEDATA)
	./stripper.pl > $(SPICEGRAPH)

graph:
	$(GRAPHTOOL_GNUPLOT) $(GRAPHFLAGS_GNUPLOT) $(GRAPHCMDFILE_GNUPLOT)

math:
	$(MATHTOOL) $(MATHFLAGS)

sch2pcb:
	$(SCH2PCB_TOOL) $(SCH2PCB) $(SCH2PCB_FLAGS)

pcb:    sch2pcb
	$(PCBTOOL) $(PCBS)

gerbv:
	$(PCBVIEW) $(PCBVIEWFLAGS) $(GERBERS)

bom:
	$(BOMTOOL) $(BOMFLAGS) $(PCBS)

alberta:
	mv $(NAME)-art.frontsilk.gbr cslk.gbr
	mv $(NAME)-art.front.gbr compont.gbr
	mv $(NAME)-art.frontmask.gbr cmsk.gbr
	mv $(NAME)-art.back.gbr solder.gbr
	mv $(NAME)-art.backmask.gbr smsk.gbr
	mv $(NAME)-art.plated-drill.cnc drill.cnc
	rm $(NAME)-art.fab.gbr $(NAME)-art.frontpaste.gbr 
	zip -jk $(NAME).zip *.gbr drill.cnc ascorder.txt READ.ME
	echo "Do not forget to change the ascorder.txt and READ.ME"

clean:
	rm *.sch~
	rm *.net
	rm *.dat


