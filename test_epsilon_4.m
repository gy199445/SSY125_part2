u = [0 0 0 1 1 1 0 1 1 1];
tre = poly2trellis([4 4],[4 10 0;2 0 10],[11 11]);
[coded, final_state] = convenc(u,tre);
