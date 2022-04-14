tic
IS_SIGNED = [1, 1, 1, 1, 1, 1, 1, 1, 1, 0 ,0];
num_rows = floor(num/NUM_COL_B);
is_start = 0;%are we on a start bit
count_offset = 0;% offset for the start of the sections
fdata = int64(zeros(num_rows,NUM_COL_WORDS));%PLace holder for final parsed data
for row = 1:num_rows
        %% Read Start bytes to align data
        if(row*NUM_COL_B>num)%break if we reach the end too early. dont bother with the unaligned bytes
            break
        end
        is_start = 0;
        while(~is_start)
            basei = (row-1)*NUM_COL_B+1+count_offset;%first index of this line
            if(rdata(basei)==START_BYTE)
                if(rdata(basei+1)==START_BYTE)
                    is_start = 1;
                elseif(basei>1)
                        if(rdata(basei-1)==START_BYTE)
                            count_offset= count_offset-1;
                            basei = (row-1)*NUM_COL_B+1+count_offset;%first index of this line
                            is_start = 1;
                        end
                end
            end
            if(~is_start)
                count_offset = count_offset+1;
            end
        end
        if(row*NUM_COL_B>WORD_LEN*prod(size(fdata),'all') || (basei+NUM_COL_B+2>num))%check if dimensions are out of bounds again
            break
        end
        %% Parse data
        baseid = basei+2; %First index with data
        for col = 1:NUM_COL_WORDS
            baserow=baseid+(col-1)*WORD_LEN;
            
            fdata(row,col) = int64(concat(rdata(baserow),rdata(baserow+1),rdata(baserow+2),rdata(baserow+3),IS_SIGNED(col)));
        end
end

fprintf("Finished parsing data in %f seconds\n",toc);

%% write to file
writematrix(fdata,fname);
speed = 50000000./fdata(:,8);
%Alert user
disp("Process Complete")
finishedwave = [sin(1:.6:400), sin(1:.7:400), sin(1:.4:400)];
Audio = audioplayer(finishedwave, 22050);
play(Audio);

%% function to concatinate variables
function [data]=concat(d3,d2,d1,d0,issigned)
    data = uint32(bitshift(uint32(d0),3*8)+bitshift(uint32(d1),2*8)+bitshift(uint32(d2),8)+uint32(d3));
    if(issigned==1)
        data = typecast(data,'int32');
    end
end