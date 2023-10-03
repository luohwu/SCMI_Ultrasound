clear
startSonicLab()
AixplorerIP='172.19.126.77'
srv = remoteDefineServer(AixplorerIP);
addpath("igtl")
M = [1.0, 0.0, 0.0, 0.0;
    0.0, 1.0, 0.0, 0.0;
    0.0, 0.0, 1.0, 0.0;
    0.0, 0.0, 0.0, 1.0];
sd = igtlopen('localhost', 18944);
while 1
    [screenImg info] = getLiveScreen(srv);
    scales=info.scale;
    position=info.position;
    screenImg=rgb2gray(screenImg);
    %imshow(screenImg)

    % wrap it for streamming 
    dims=size(screenImg);
    screenImg = reshape(screenImg, [dims(2), dims(1)]);
    IMGDATA.Type = 'IMAGE';
    IMGDATA.Name = 'MatlabImage';
    IMGDATA.Image = screenImg;
    IMGDATA.Trans = M;
    r = igtlsend(sd, IMGDATA);
end
      
