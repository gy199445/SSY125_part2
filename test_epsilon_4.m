% run E4_trellis.m to get trellis first
%% encode
u = [1 0 1 1 0 0 1 0 1 0 0 1];
[coded, final_state] = convenc(u,trellis);
%% decode
e = randsrc(1,length(coded),[0 1;0.95 0.05]);
decoded = vitdec(bitxor(coded,e),trellis,4,'trunc','hard');
if sum(bitxor(u,decoded)) == 0
    fprintf('\npass\n')
else
    fprintf('\n %d error\n',sum(bitxor(u,decoded)))
end