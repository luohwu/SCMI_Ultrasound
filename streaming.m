clear
startSonicLab()
AixplorerIP='172.19.126.77'
srv = remoteDefineServer(AixplorerIP);
addpath("igtl")
i=0
while 1
    [screenImg info] = getLiveScreen(srv);
    imshow(screenImg)
    %formatSpec = 'data/%d.png';
    %filename = sprintf(formatSpec,i);
    %i=i+1;
    %imwrite(screenImg,filename);
end
      
