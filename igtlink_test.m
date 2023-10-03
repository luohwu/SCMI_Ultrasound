%%% read image data


%%% affine transform matrix
M = [1.0, 0.0, 0.0, 0.0;
    0.0,-1.0, 0.0, 0.0;
    0.0, 0.0, 1.0, 0.0;
    0.0, 0.0, 0.0, 1.0];


%%% send the image data through OpenIGTLink connection
sd = igtlopen('localhost', 18944);
i=0
while 1
    formatSpec = '%d.png';
    idx=rem( i , 20 )
    filename = sprintf(formatSpec,idx);
    fid = fopen(filename, 'r');
    I = fread(fid, [256 256], 'uint8')';
    fclose(fid);
    IMGDATA.Type = 'IMAGE';
    IMGDATA.Name = 'MatlabImage';
    IMGDATA.Image = I;
    IMGDATA.Trans = M;
    r = igtlsend(sd, IMGDATA);
    i=i+1;
end

igtlclose(sd);