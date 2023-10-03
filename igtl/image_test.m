%%% read image data
fid = fopen('igtlTestImage1.raw', 'r');
I1 = fread(fid, [256 256], 'uint8')';
fclose(fid);


%%% send the image data through OpenIGTLink connection
sd = igtlopen('localhost', 18944);
i=0
while 1
    formatSpec = '%d.png';
    idx=rem( i , 20 );
    filename = sprintf(formatSpec,idx);
    i=i+1;

    I2 = imread(filename);
    I2 = rgb2gray(I2);
    %I2 = reshape(I2, [574, 829]);
    dims=size(I2);

    I2 = reshape(I2, [dims(2), dims(1)]);
    % I2 = padarray(I2, [43, 0], 0);
    % I2 = I2(2:end, :);


    M = [-1.0, 0.0, 0.0, 0.0;
        0.0, -1.0, 0.0, 0.0;
        0.0, 0.0, 1.0, 0.0;
        0.0, 0.0, 0.0, 1.0];
    
    IMGDATA.Type = 'IMAGE';
    IMGDATA.Name = 'MatlabImage';
    IMGDATA.Image = I2;
    IMGDATA.Trans = M;

    r = igtlsend(sd, IMGDATA);
    pause(0.1);
end

igtlclose(sd);