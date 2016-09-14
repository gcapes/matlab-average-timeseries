function [tstart,tend]= tcutsfrommids(tmid,time_step)
% tmid is the time mid-points
% interval is the required averaging interval in the same units as tmid
% The averaging will happen over tmid-0.5*interval to tmid+0.5*interval
% i.e. cuts are half way between the mid-points.

tstart=tmid-0.5*time_step;
tend=tmid+0.5*time_step;
