% Script to load data and average it all.
clear all

% Location of data file -this needs modifying for your computer
datafile='/mnt/p-drive/application_support/MATLAB/code_enquiries/James_Thomson/Volt v image avg 3set.xlsm'

% Load the 'DL' data - these scripts could easily be modified to load the
% other data
load_dl_lf_data
load_dl_hf_data

%% Do the actual analysis
% Generate time cuts from the low-frequency time array
[lf_tstart,lf_tend]= tcutsfrommids(lf_time,0.5);

% Calculate which data range in the high-frequency data corresponds to the
% low-frequency time intervals
[av_ints]=get_average_intervals(lf_tstart,lf_tend,hf_time);

% Do the averaging for each data set 1-4, treating lf_time as tmid.
[av_0]=average_data(av_ints,hf_0);
[av_1]=average_data(av_ints,hf_1);
[av_2]=average_data(av_ints,hf_2);
[av_3]=average_data(av_ints,hf_3);

%% Repeat the averaging treating lf_time as the end time, and lf_time-0.5s as the start
% time
% Create new array to act as t_start (we're now using lf_time as tend)
lf_tstart_endstamp=lf_time-0.5;

% Recalculate averaging intervals
[av_ints_endstamp]=get_average_intervals(lf_tstart_endstamp,lf_time,hf_time);

% Repeat averaging over new time intervals
[av_0_endstamp]=average_data(av_ints_endstamp,hf_0);
[av_1_endstamp]=average_data(av_ints_endstamp,hf_1);
[av_2_endstamp]=average_data(av_ints_endstamp,hf_2);
[av_3_endstamp]=average_data(av_ints_endstamp,hf_3);

%% Plot original data and averaged data using both time stamp assumptions
% Original high frequency data
figure
plot(hf_time,hf_0)
hold on
% Plot first averages against lf_time (which we have assumed is tmid)
plot(lf_time,av_0,'LineWidth',2)
% Plot second averages against lf_time-0.25 (treating lf_time as tend)
hold on
plot(lf_time-0.25,av_0_endstamp)
legend('Original data','DL data 0 using lf\_time as mid point','using lf\_time as end point')

figure
plot(hf_time,hf_1) % Original data
hold on
plot(lf_time,av_1,'LineWidth',2)
hold on
plot(lf_time-0.25,av_1_endstamp)
legend('Original data','DL data 1 using lf\_time as mid point','using lf\_time as end point')