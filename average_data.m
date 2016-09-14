function [averaged]=average_data(averaging_intervals,hf_data)
% averaging_intervals is a cell array describing which data points in the
% high frequency time series fall into which time step in the low-frequency
% time series.

% hf_data is the high-frequency data to be averaged onto the low-frequency
% time base.

for i=1:length(averaging_intervals);
    averaged(i)=mean(hf_data(averaging_intervals{i}));
end