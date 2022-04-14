function [sData,st] = sampledata(samplerate,Data,t,stoptime)
%sample data at a given rate of time
    datasize = size(Data);
    %[v, idxfirst]=min(abs(t-samplerate));
 
    lengthsampling = stoptime*samplerate;
    st = zeros(lengthsampling,1);
    sData = zeros(lengthsampling,datasize(2));

    
    
    for idx = 1:lengthsampling
            [val,index] = min(abs(t-idx/samplerate));
            st(idx) = t(index);
        for jdx = 1:datasize(2)
            sData(idx,jdx)=Data(index,jdx);
        end
    end


end

