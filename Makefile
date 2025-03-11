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
NAME2 = notchfilter
NAME3 = highpass
#Project Schematics
SCHEMATICS = bioamp.sch output.sch twinax_doc.sch notchfilter.sch highpass.sch rackpower.sch batterypower.sch testfixture.sch
#
SCHEMATICS2 = notchfilter.sch
SCHEMATICS3 = highpass.sch
#Project Netlists
NETLISTS = $(NAME).net
#Project SPICE Simulation Data
SPICEDATA = $(NAME).dat
#Project SPICE Data to Graph
SPICEGRAPH = $(NAME)SPICE.csv
#Project GNUCAP Simulation Data

#Project GNUCAP Data to Graph

#files for the math
MATHFILE = filter.m
MATHFILENOTCH = notch.m
#Project Graphing Programs
GRAPHCMDFILE_GNUPLOT = plot.gnu
#Project Schematics to PCB File
SCH2PCB = project.lht
SCH2PCB2 = project2.lht
SCH2PCB3 = project3.lht
#Project Printed Circuit Boards
PCBS = bioamp-art.lht
PCBS2 = notchfilter-opt-art.lht
PCBS3 = highpass-opt-art.lht
#Project Gerbers
GERBERS = oshpark/$(NAME)-art.fab oshpark/$(NAME)-art.xln oshpark/$(NAME)-art.ast oshpark/$(NAME)-art.gto oshpark/$(NAME)-art.gtp oshpark/$(NAME)-art.gtl oshpark/$(NAME)-art.gko oshpark/$(NAME)-art.gts oshpark/$(NAME)-art.gbp oshpark/$(NAME)-art.gbs oshpark/$(NAME)-art.gbl oshpark/$(NAME)-art.gbo oshpark/$(NAME)-art.asb
GERBERS2 = oshpark2/$(NAME2)-opt-art.fab oshpark2/$(NAME2)-opt-art.xln oshpark2/$(NAME2)-opt-art.ast oshpark2/$(NAME2)-opt-art.gto oshpark2/$(NAME2)-opt-art.gtp oshpark2/$(NAME2)-opt-art.gtl oshpark2/$(NAME2)-opt-art.gko oshpark2/$(NAME2)-opt-art.gts oshpark2/$(NAME2)-opt-art.gbp oshpark2/$(NAME2)-opt-art.gbs oshpark2/$(NAME2)-opt-art.gbl oshpark2/$(NAME2)-opt-art.gbo oshpark2/$(NAME2)-opt-art.asb
GERBERS3 = oshpark3/$(NAME3)-opt-art.fab oshpark3/$(NAME3)-opt-art.xln oshpark3/$(NAME3)-opt-art.ast oshpark2/$(NAME3)-opt-art.gto oshpark3/$(NAME3)-opt-art.gtp oshpark3/$(NAME3)-opt-art.gtl oshpark3/$(NAME3)-opt-art.gko oshpark3/$(NAME3)-opt-art.gts oshpark3/$(NAME3)-opt-art.gbp oshpark3/$(NAME3)-opt-art.gbs oshpark3/$(NAME3)-opt-art.gbl oshpark3/$(NAME3)-opt-art.gbo oshpark3/$(NAME3)-opt-art.asb


#
## Text Editor
TEXTEDITOR = vi
#
## Math Tool (you still have to type notebook() after this starts though)
MATHTOOL = octave
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

mainmath:
	$(MATHTOOL) $(MATHFLAGS) $(MATHFILE)

editmainmath:
	$(TEXTEDITOR) $(MATHFILE)

notchmath:
	$(MATHTOOL) $(MATHFLAGS) $(MATHFILENOTCH)

editnotchmath:
	$(TEXTEDITOR) $(MATHFILENOTCH)

sch2pcb:
	$(SCH2PCB_TOOL) $(SCH2PCB) $(SCH2PCB_FLAGS)

pcb:    sch2pcb
	$(PCBTOOL) $(PCBS)

sch2pcb2:
	$(SCH2PCB_TOOL) $(SCH2PCB2) $(SCH2PCB_FLAGS)

pcb2:	sch2pcb2
	$(PCBTOOL) $(PCBS2)

sch2pcb3:
	$(SCH2PCB_TOOL) $(SCH2PCB3) $(SCH2PCB_FLAGS)

pcb3:	sch2pcb3
	$(PCBTOOL) $(PCBS3)


gerbv:
	$(PCBVIEW) $(PCBVIEWFLAGS) $(GERBERS)

gerbv2:
	$(PCBVIEW) $(PCBVIEWFLAGS) $(GERBERS2)

gerbv3:
	$(PCBVIEW) $(PCBVIEWFLAGS) $(GERBERS3)

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


