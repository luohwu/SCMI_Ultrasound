function startSonicLab()
% add sonic lab paths

installPath = which('startSonicLab.m');
installPath = installPath(1:end-25)

addpath(fullfile(installPath,'xmltree-2.0'));
addpath(fullfile(installPath,'bin'));
addpath(fullfile(installPath,'commands'));
addpath(fullfile(installPath,'sequence_libs'));

