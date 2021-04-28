
Tera = 10^9;
Mega = 10^6;
Kilo = 10^3;
milli = 10^-3;
micro = 10^-6;
nano = 10^-9;
pico = 10^-12;
femto = 10^-15;




#h = v_out / v_in 
#in other words h is mid band gain
H = 1

#f_c = center frequency
f_c = 60
#f_hi = high frequency
f_hi = 65
#f_low = low frequency
f_low = 55
#bw = bandwidth
bw = f_hi - f_low

#Quality factor
Q = f_c / bw

#Starting value (in farads)
C1 = 0.47*micro

# assume
C2 = C1

#The following math is from 2 sources
# http://www.ecircuitcenter.com/Circuits/MFB_bandpass/MFB_bandpass.htm
# https://www.analog.com/media/en/training-seminars/tutorials/MT-218.pdf
# https://sound-au.com/project63.htm
#note the analog.com file has a typo that omits the exponent in one equation (Q^2)
# I also read this one
# http://www.ee.nmt.edu/~wedeward/EE212L/SP17/MultipleFeedbackTopologyBPF.html

#k = scaling factor
k = 2*pi*f_c*C1

R100 = Q / (H * k)

R101 = Q / (( (2*Q^2) - H) *k)

R102 = ( 2*Q ) / k

disp("\nSelected Values\n");

#For 390nF this was a good choice
#R100 = 40.7*Kilo
#R101 = 576
#R102 = 81.6*Kilo

#C = 470nF
R100 = (67.3*Kilo)/2 #33.6*Kilo
R101 = 475
R102 = 67.3*Kilo


#checks from Opamps for Everyone
#August 2002
#file : OP amp for everyone.pdf
#page 16-31 (309) "Active Filter Design Techniques"
check_gain = R102 / (R100 * 2)
check_freq_c =(1 / ( 2 * pi * C1 )) * sqrt(( R100 + R101 ) / ( R100 * R101 * R102 ))
check_bw = 1 / (pi * R102 * C1 )
check_q = pi*check_freq_c*R102*C1

