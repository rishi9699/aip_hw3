function res = mtimes(A,x)

	
	img = idct2(reshape(x(1:48400), [220 220]));  %check reshape
    res1 = radon(img, A.angles1); % 315*18 = 5670
	
	img = idct2(reshape(x(1:48400) + x(48401:96800), [220 220]));  %check reshape
    res2 = radon(img, A.angles2); % 315*18 = 5670
	
	img = idct2(reshape(x(1:48400) + x(96801:145200), [220 220]));  %check reshape
    res3 = radon(img, A.angles3); % 315*18 = 5670
	
    res = [reshape(res1, [], 1); reshape(res2, [], 1); reshape(res3, [], 1)];  %Check reshape
	
end
