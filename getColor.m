% getColor  get color image displayed on the system
%   [R0, R1, info] = getColor(srv,range) get R0, R1 (complex) and corresponding info
%   from server srv
%   range = 'last', gets only last acquired frame (when srv receive the
%   command)
%   range = 'all', gets all the cineloop
%   info.box_position = color box position in mm [axial, lateral] in
%   curvilinear coordinates
%   info.box_size = color box size in mm [axial, lateral] in curvilinear
%   coordinates
