function print_to_file(varargin)

if nargin == 1
    matrix = varargin{1};
    writematrix(matrix, sprintf('%s', datestr(now, 'HH_MM_SS.FFF.txt')), 'Delimiter','tab')

elseif nargin == 2
    matrix = varargin{1};
    filename = varargin{2};
    writematrix(matrix, sprintf('%s', filename), 'Delimiter','tab')

else
   error('Only 1 or 2 args!') 
    
end

end