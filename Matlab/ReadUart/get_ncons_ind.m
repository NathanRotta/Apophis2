function [indeces] = get_ncons_ind(vector)
prev = vector(1);
indeces = [];
for idx = 2:length(vector)
    if(vector(idx)~=prev+1)
        indeces = [indeces,idx];
    end
    prev=vector(idx);
end

end

