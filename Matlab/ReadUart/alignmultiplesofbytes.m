num_rows = floor(length(rdata)/NUM_COL_B);
aligned_data = uint8( zeros(num_rows,NUM_COL_B) );

for row = 1:num_rows
    for col = 1:NUM_COL_B
        aligned_data(row,col) = rdata(row*NUM_COL_B+col);
    end
end