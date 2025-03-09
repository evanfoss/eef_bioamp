
Tera = 10^9;
Mega = 10^6;
Kilo = 10^3;
milli = 10^-3;
micro = 10^-6;
nano = 10^-9;
pico = 10^-12;
femto = 10^-15;

printf("\n\n");

# First the high pass filter

# Tollerance
# 2.5%
tol = 0.0025

hpf_hz = 300

# I picked C20 to match the capacitors in the 60Hz notch filter.

C20 = 470 * nano

R20_estimate = 1/(2*pi*( hpf_hz * C20))

R20 = 1.13*Kilo

hpf_hz_typical = 1 / (2*pi*( C20 * R20))

hpf_tol_typical =  ( abs(hpf_hz - hpf_hz_typical) / hpf_hz ) * 100

if (hpf_hz_typical >= hpf_hz *( 1+tol )) || (hpf_hz_typical >= hpf_hz *( 1-tol ))
   printf("R20 selection looks good.\n");
else
   printf("R20 selection needs to be changed.\n");
endif

printf("\n\n");

# Now the low gain setting

# Tollerance
# 2.5%
tol = 0.0025

lpf1_hz = 14*Kilo

R63 = 5*Kilo

C61_estimated = 1 / (2*pi* lpf1_hz * R63)

C61 = 2.2*nano

lpf1_hz_typical = 1 / (2*pi* C61 * R63)

lpf1_tol_typical =  ( abs(lpf1_hz - lpf1_hz_typical) / lpf1_hz ) * 100

if (lpf1_hz_typical >= lpf1_hz *( 1+(tol * 4) )) || (lpf1_hz_typical >= lpf1_hz *( 1-tol ))
   printf("C61 selection looks good.\n");
else
   printf("C61 selection needs to be changed.\n");
endif

printf("\n\n");

# High gain setting

# Tollerance
# 2.5%
tol = 0.0025

R64 = 50*Kilo

C62_estimated = 1 / (2*pi* lpf1_hz * R64)

C62 = 220*pico

lpf2_hz_typical = 1 / (2*pi* C62 * R64)

lpf2_tol_typical =  ( abs(lpf1_hz - lpf2_hz_typical) / lpf1_hz ) * 100

if (lpf2_hz_typical >= lpf1_hz *( 1+(tol * 4))) || (lpf2_hz_typical >= lpf1_hz *( 1-tol ))
   printf("C62 selection looks good.\n");
else
   printf("C62 selection needs to be changed.\n");
endif

printf("\n\n");

# Now the output stage low pass filter's high bw setting

# Tollerance
# 5.5%
tol = 0.0055

lpfH_hz = 10*Kilo

R10 = 1*Kilo

C10_estimated = 1 / (2*pi* lpfH_hz * R10)

C10 = (1 + 15)*nano

lpfH_hz_typical = 1 / (2*pi* C10 * R10)

lpfH_tol_typical =  ( abs(lpfH_hz - lpfH_hz_typical) / lpfH_hz ) * 100

if (lpfH_hz_typical >= lpfH_hz *( 1+tol )) || (lpfH_hz_typical >= lpfH_hz *( 1-tol ))
   printf("C10 selection looks good.\n");
else
   printf("C10 selection needs to be changed.\n");
endif

printf("\n\n");

# Now the output stage low pass filter's low bw setting

# Tollerance
# 2.5%
tol = 0.0025

lpfL_hz = 3*Kilo

C15_estimated = 1 / (2*pi* lpfL_hz * R10)

C15 = (3.9 + 33)*nano

lpfL_hz_typical = 1 / (2*pi* (C15 + C10) * R10)

lpfL_tol_typical =  ( abs(lpfL_hz - lpfL_hz_typical) / lpfL_hz ) * 100

if (lpfL_hz_typical >= lpfL_hz *( 1+tol )) || (lpfL_hz_typical >= lpfL_hz *( 1-tol ))
   printf("C15 selection looks good.\n");
else
   printf("C15 selection needs to be changed.\n");
endif

printf("\n\n");

printf("Keep in mind the 300Hz bottom and 3KHz top are the most important values. The 10KHz setting is less critical.\n");



