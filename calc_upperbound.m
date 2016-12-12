%calculate upper bounds
%parameters:
%e1 3,{'1+x^2','1+x+x^2'}
%e2 5,{'1+x^2+x^3+x^4','1+x^2+x^3'}
%e3 5,{'1+x^3+x^4','1+x+x^2+x^3+x^4'}
%e4 [4 4],[4 10 0;2 0 10],[11 11] (not sure)
trellis = poly2trellis(5,{'1+x^2+x^3+x^4','1+x^2+x^3'});
spect = distspec(trellis);
code_rate = 0.5;
EbN0 = -1:0.5:12;
berub = bercoding(EbN0,'conv','soft',code_rate,spect); % BER bound
semilogy(EbN0,berub);
ylabel('Upper Bound on BER'); % Plot.
axis([-1 10 1E-5 1])
grid on