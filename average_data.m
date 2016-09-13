function [data_av]=average_data(hf_time,lf_time,varargin)
% hf_time = high frequency time stamp
% lf_time = low frequency time stamp
% varargin =  high frequency data to be averaged onto lf_time

% Assert to check number of input arguments, and number of data points that
% they have is the same as hf_time
tic
nArgs=length(varargin);
lf_len=size(lf_time);

% Create structure containing averaged data, because
% MATLAB can't easily assign variable names from strings
for arg=1:nArgs
    data_av.(inputname(arg+2))=zeros(lf_len);
end


for i=1:lf_len-1 % This loses the last data point so we end up with zero as 
    % the last value.
    % Loop through low frequency data, finding all
    % points which meet the condition of being between the first two
    % adjacent data points
    
    indices=find(hf_time>lf_time(i) & hf_time<lf_time(i+1));
    if size(indices)>0
        % Average the data
        for arg=1:nArgs
            data_av.(inputname(arg+2))(i)=mean(varargin{arg}(indices));
        end
    else
        % Assign NaN
        for arg=1:nArgs
            data_av.(inputname(arg+2))(i)=NaN;
        end
    end
end
toc

% Save data to csv like this
% writetable(struct2table(averaged_data),'DL_averaged.csv')