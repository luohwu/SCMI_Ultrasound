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
    M(1,1)=scales(1);
    M(1,2)=scales(2);
    position=info.position;
    I=rgb2gray(screenImg);
    dims=size(I);
    I = reshape(I, [dims(2), dims(1)]);
    imshow(screenImg)


    IMGDATA.Type = 'IMAGE';
    IMGDATA.Name = 'MatlabImage';
    IMGDATA.Image = I;
    IMGDATA.Trans = M;
    %IMGDATA.Timestamp=now;
    r = igtlsend(sd, IMGDATA);
end
      
