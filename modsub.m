% i is the time
% T is the period of the function
function index = modsub(i,T)
t = mod(i,T);
if(t == 0)
    t = T;
end
index = t;
end