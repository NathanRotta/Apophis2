NUM_COL_WORDS = 11;
WORD_LEN = 4;
NUM_COL_B = NUM_COL_WORDS*WORD_LEN+2;
START_BYTE = uint8(0xf0);
IS_SIGNED = [0, 0, 0, 0, 1, 0, 0, 0, 0, 0 ,0];
if(exist('s','var'))
    if('internal.Serialport'~=class(s))
        connect_serial
    end
else
    connect_serial
end
num=input("how many bytes to read: ");
fname=input("save file name: ",'s');
disp("Reading Data")
flush(s);
tic
rdata = uint8(read(s,num,"uint8")); %read raw data
fprintf("Finished reading in data in %f seconds\n",toc);

parseandwrite

