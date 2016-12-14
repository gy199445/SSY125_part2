numInputSymbols = 4;
numOutputSymbols = 8;
numStates = 8;
nextStates = -1*ones(8,4);
outputs = -1*ones(8,4);
reg = zeros(2,3);
for CurrentState = 0:7
    for info = 0:3
        %initialize register
        reg(1,:) = de2bi(CurrentState,3,'left-msb');
        info_bits = de2bi(info,2,'left-msb');
        % calculate output
        c1 = reg(1,3);
        outputs(CurrentState+1,info+1) = bi2de([c1 info_bits],'left-msb');
        % update registers
        reg(2,2) = bitxor(info_bits(2),reg(1,1));
        reg(2,3) = bitxor(info_bits(1),reg(1,2));
        reg(2,1) = reg(1,3);
        % calculate next state
        nextStates(CurrentState+1,info+1) = bi2de(reg(2,:),'left-msb');
    end
end
trellis = struct('numInputSymbols',numInputSymbols,'numOutputSymbols',numOutputSymbols,'numStates',numStates,'nextStates',nextStates,'outputs',outputs);