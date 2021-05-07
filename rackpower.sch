v 20201211 2
C 40000 40000 0 0 0 title-C.sym
C 43500 52600 1 0 0 connector6-1.sym
{
T 45300 54400 5 10 0 0 0 0 1
device=CONNECTOR_6
T 43500 55000 5 10 1 1 0 0 1
refdes=CONN500
T 43500 54600 5 10 1 1 0 0 1
comment=From Edgecard
T 43500 54800 5 10 1 1 0 0 1
footprint=22-01-3067
}
C 46000 54200 1 0 0 output-1.sym
{
T 46100 54500 5 10 0 0 0 0 1
device=OUTPUT
T 46900 54300 5 10 1 1 0 1 1
net=CHASSIS:1
}
N 45200 54300 46000 54300 4
N 45200 54000 46000 54000 4
C 46000 53900 1 0 0 output-1.sym
{
T 46100 54200 5 10 0 0 0 0 1
device=OUTPUT
T 46900 54000 5 10 1 1 0 1 1
net=COMMON:1
}
N 45200 53700 46000 53700 4
C 46000 53600 1 0 0 output-1.sym
{
T 46100 53900 5 10 0 0 0 0 1
device=OUTPUT
T 46900 53700 5 10 1 1 0 1 1
net=N17V:1
}
N 45200 53400 46000 53400 4
C 46000 53300 1 0 0 output-1.sym
{
T 46100 53600 5 10 0 0 0 0 1
device=OUTPUT
T 46900 53400 5 10 1 1 0 1 1
net=N15V:1
}
C 46000 53000 1 0 0 output-1.sym
{
T 46100 53300 5 10 0 0 0 0 1
device=OUTPUT
T 46900 53100 5 10 1 1 0 1 1
net=P15V:1
}
N 45200 53100 46000 53100 4
C 46000 52700 1 0 0 output-1.sym
{
T 46100 53000 5 10 0 0 0 0 1
device=OUTPUT
T 46900 52800 5 10 1 1 0 1 1
net=P17V:1
}
N 45200 52800 46000 52800 4
N 53500 53900 57500 53900 4
N 53500 53000 57500 53000 4
N 55600 53600 57500 53600 4
T 56100 49700 8 10 0 1 0 6 1
netname=N15V
N 57500 52700 55600 52700 4
C 59200 52500 1 0 1 connector5-1.sym
{
T 57400 54000 5 10 0 0 0 6 1
device=CONNECTOR_5
T 59200 54400 5 10 1 1 0 6 1
refdes=CONN501
T 59200 54200 5 10 1 1 0 6 1
device=22-01-3057
}
C 55600 53500 1 0 1 output-1.sym
{
T 55500 53800 5 10 0 0 0 6 1
device=OUTPUT
T 54700 53600 5 10 1 1 0 7 1
net=COMMON:1
}
C 55600 52600 1 0 1 output-1.sym
{
T 55500 52900 5 10 0 0 0 6 1
device=OUTPUT
T 54700 52700 5 10 1 1 0 7 1
net=CHASSIS:1
}
T 58650 53350 9 10 1 0 0 6 1
COMMON
T 58650 53050 9 10 1 0 0 6 1
+15V
T 58650 52750 9 10 1 0 0 6 1
CHASSIS
T 58650 53650 9 10 1 0 0 6 1
COMMON
T 58650 53950 9 10 1 0 0 6 1
-15V
C 52700 52900 1 0 0 input-1.sym
{
T 52700 53200 5 10 0 0 0 0 1
device=INPUT
T 52600 53000 5 10 1 1 0 7 1
net=P15V:1
}
C 52700 53800 1 0 0 input-1.sym
{
T 52700 54100 5 10 0 0 0 0 1
device=INPUT
T 52600 53900 5 10 1 1 0 7 1
net=N15V:1
}
T 55000 40700 9 8 1 0 0 0 1
Biological Amplifier Subrack Power
T 58900 40100 9 8 1 0 0 0 1
Evan Foss
T 58800 40400 9 8 1 0 0 0 1
2021.05.06
T 54900 40400 9 8 1 0 0 0 1
rackpower.sch
T 56500 40100 9 8 1 0 0 0 1
4
T 55000 40100 9 8 1 0 0 0 1
4