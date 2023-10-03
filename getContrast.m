% getContrast  get contrast image displayed on the system
%   [x,z, ContrastImg] = getContrast(srv,range,outputDimension) get EchoImg and corresponding info
%   from server srv
%   range = 'last', gets only last acquired frame (when srv receive the
%   command)
%   range = 'all', gets all the cineloop
%   outputDimension: output size of the image [Nz Nx] (default 512 x 512)
%   x,z: axis in mm
%   See also getColor , getSWE , getEcho
