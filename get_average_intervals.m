% Calculate the averaging intervals once, then do the averaging for
% whichever data sets are required.

function [av_ints]=get_average_intervals(lf_tstart,lf_tend,hf_tend)
% hf_tend = high frequency time stamp (save time)
% This measurement represents a few ms of averaging time before the save
% time

% lf_tstart = low frequency start time. Used to define averaging interval.
% lf_tend= low frequency end time. Used to define averaging interval.

% Check that the low frequency time arrays have the same length
assert(length(lf_tstart)==length(lf_tend))

lf_len=length(lf_tstart);

av_ints=cell(lf_len,1); 

for i=1:lf_len
    % Loop through low frequency data, finding all data points which are
    % between the time cuts
    
    indices=find(hf_tend>lf_tstart(i) & hf_tend<lf_tend(i));
    av_ints{i}=indices;
%     if size(indices)>0
%         % Average the data
%         data_av(i)=mean(hf_data(indices));
%     else
%         % Assign NaN
%         data_av(i)=NaN;
%     end
end