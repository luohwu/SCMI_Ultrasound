% getSWE  get SWE image displayed on the system
%  [Emap, info] = getSWE(srv,range) get SWE image and corresponding info
%  from the server srv
%   range = 'last', gets only last acquired frame (when srv receive the
%   command)
%   range = 'all', gets all the cineloop
%   Emap in m/s
%   info.box_position = SWE box position in mm [axial, lateral] in
%   curvilinear coordinates
%   info.box_size = SWE box size in mm [axial, lateral] in curvilinear
%   coordinates
%
%   See also getEcho , getColor , getContrast
