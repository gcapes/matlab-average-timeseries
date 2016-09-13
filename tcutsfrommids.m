% Limitations are that if there are any missing data points (time stamps)
% then the averaging interval will be incorrect
function [tstart,tend]= tcutsfrommids(tmid,interval)
% tmid is the time mid-points
% interval is the required averaging interval in the same units as tmid
% The averaging will happen over tmid-0.5*interval to tmid+0.5*interval
% i.e. cuts are half way between the mid-points.

tstart=tmid-0.5*interval;
tend=tmid+0.5*interval;
