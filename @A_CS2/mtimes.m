function res = mtimes(A,x)

	
	img = idct2(reshape(x(1:48400), [220 220]));  %check reshape
    res = radon(img, A.angles1); % 315*18 = 5670
    res = reshape(res, [], 1);  %Check reshape
	
	img = idct2(reshape(x(1:48400) + x(48401:2*48400), [220 220]));  %check reshape
    res2 = radon(img, A.angles2); % 315*18 = 5670
    res = [res; reshape(res2, [], 1)];  %Check reshape
	
end
