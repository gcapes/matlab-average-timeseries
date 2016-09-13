function [data_av,avints]=average_data(lf_tcuts,hf_tend,hf_data)
% hf_tend = high frequency time stamp (save time)
% This measurement represents a few ms of averaging time before the save
% time

% lf_tcuts = low frequency time cuts. Used to define averaging interval.
% varargin =  high frequency data to be averaged onto lf_time

% hf_data is the data to be averaged

% Check that data series has correct number of data points
assert(length(hf_tend)==length(hf_data))

tic
lf_len=length(lf_tcuts)-1;

data_av=zeros(lf_len,1);

avints=cell(lf_len,1); % This would be better as a separate function.
% Calculate the averaging intervals once, then do the averaging for
% whichever data sets are required.

for i=1:lf_len
    % Loop through low frequency data, finding all data points which are
    % between the time cuts
    
    indices=find(hf_tend>lf_tcuts(i) & hf_tend<lf_tcuts(i+1));
    avints{i}=indices;
    if size(indices)>0
        % Average the data
        data_av(i)=mean(hf_data(indices));
    else
        % Assign NaN
        data_av(i)=NaN;
    end
end
toc