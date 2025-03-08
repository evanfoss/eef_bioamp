# EEF_BioAmp

This project is a family of differential input amplifiers with single ended outputs for use in electrophysiology. 
They are all *not* rated for use on humans. Let me repeat do not connect this to a person. If you do I am not responsible.

This is a fork of my original work here: https://github.com/EPL-Engineering/epl_bioamp

There are a few versions

EEF BioAmp "Fancy" - (master branch)

EEF BioAmp "Cheap" - (cheap branch)

# EEF BioAmp "Fancy"
The "Fancy" version has every bell and whistle we reasonably expect a user to need for doing ABR, DP, and EKG. Often these users have multiple dedicated amplifiers and prefer to use more involved filtering so that EKG signals can be seperated from ABR and etc for example.
The feature set I have given it so far includes.
* Twinaxial BNC Input
* Coaxial BNC Output
* Gain of 1K/10K or Gain of 10K/100K
* LPF 3KHz/10KHz
* HPF 300Hz 
* Optional the HPF can be 300Hz/10Hz
* Optional Power Line Frequency Rejection (currently 60Hz but I may do 50Hz in the future)
* Optional EPL Subrack Power
* Optional Battery Power

Please Note: The HPF option and Power Line Rejection option are mutually exclusive because of front panel constraints. Likewise the EPL Subrack Power and Battery Power are mutually exclusive because of rear panel space constraints. 

<img alt="Front panel of the bioamp." src="photos/IMG_0668_cropped.JPG">

<img alt="Populated ciruitboards for the bioamp." src="photos/IMG_0456.JPG">

<img alt="Circuitboards for the bioamp inside a chassis." src="photos/IMG_0673.JPG">

# EEF BioAmp "Cheap"

<this version is not maintaned currently>

The "Cheap" verion is designed to be pure minimalism. The idea was to have a lower cost version of the fancy that is just for ABR, DP, and EKG measurements. It's meant for our simple dedicated chambers where users exclusively do ABRs all day long with a single BioAmp and never adjust settings. The following is it's configuration.
* Twinaxial BNC Input
* Coaxial BNC Output
* Gain of 10K
* LPF 3KHz
* HPF 300Hz
* EPL Subrack Power
* Optional Power Line Frequency Rejection (currently just 60Hz but again I might add 50Hz later)

Please Note: The Power Line Frequency Rejection in some units is not user adjustable.

# EEF BioAmp "Breakout Pod"

This is shared between the "Cheap" and "Fancy" versions. Like both of them it is not for use on humans. 
It's features include the following.
* Twinaxial BNC Output
* 3 x 5 Way Binding Post Input
* 3 x 1.5mm Male Input (DIN 42802-1 Compatible Connectors)
* Holes on the sides for Mounting to Tables and etc.

The mounting holes are more important than they might sound. In a lot of our booths the EPL Subrack the EPL BioAmp sits in is on a shelf while the subject of the testing is on a sliding optical breadboard.

<img alt="5 breakout pods sitting next to each other." src="photos/IMG_0665.JPG">

# Development

The development toolchain was as follows:

Tool Name             | License        | Function
:---------------      | :------------- | :-----------------
<a href="https://github.com/lepton-eda/lepton-eda">lepton-eda</a>                           | Open Source       | EDA (Electronic Design Automation) suite lepton-eda a fork of gEDA
<a href="http://repo.hu/projects/pcb-rnd/">pcb-rnd</a>                                      | Open Source       | CAD (Computer Aided Design) tool for PCB (Printed Circuit Board) layout gEDA/PCB
<a href="https://gerbv.github.io/">gerbv</a>                                                | Open Source       | Gerber viewer
<a href="https://www.gnu.org/software/make/">GNU/Make</a>                                   | Open Source       | Toolchain automation
<a href="https://www.frontpanelexpress.com/front-panel-designer">Front Panel Designer</a>   | Free as in Beer   | Front Panels Express Software

<img alt="Block diagram of the fancy bioamp." src="block/bioamp_block.png">

<img alt="Bioamp input stage with integrator schematic." src="bioamp.png">
<img alt="Bioamp output stage schematic." src="output.png">
<img alt="Notch filter option schematic." src="notchfilter.png">
<img alt="Highpass filter lower frequency option schematic." src="highpass.png">
<img alt="Schematic documenting the way twinaxial coax flips polarity from device to cable and back." src="twinax_doc.png">
<img alt="Rack based power schematic." src="rackpower.png">
<img alt="Battery based power schematic." src="batterypower.png">


