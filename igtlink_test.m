%%% read image data


%%% affine transform matrix
M = [1.0, 0.0, 0.0, 0.0;
    0.0,-1.0, 0.0, 0.0;
    0.0, 0.0, 1.0, 0.0;
    0.0, 0.0, 0.0, 1.0];


%%% send the image data through OpenIGTLink connection
sd = igtlopen('localhost', 18944);
i=0
while i<200
    formatSpec = '%d.png';
    idx=rem( i , 20 );
    filename = sprintf(formatSpec,idx);
    fid = fopen(filename, 'r');
    I=imread(filename);
    I=rgb2gray(I);
    imshow(I);

    % wrap it for streamming 
    dims=size(I);
    I = reshape(I, [dims(2), dims(1)]);

    fclose(fid);
    IMGDATA.Type = 'IMAGE';
    IMGDATA.Name = 'MatlabImage';
    IMGDATA.Image = I;
    IMGDATA.Trans = M;
    r = igtlsend(sd, IMGDATA);
    i=i+1
end

igtlclose(sd);