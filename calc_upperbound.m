trellis = poly2trellis([5 4],[23 35 0; 0 5 13]);
spect = distspec(trellis,4);
code_rate = 0.5;
EbN0 = -1:0.5:12;
berub = bercoding(EbN0,'conv','hard',code_rate,spect); % BER bound
semilogy(EbN0,berub);
ylabel('Upper Bound on BER'); % Plot.