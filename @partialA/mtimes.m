function res = mtimes(A,x)

if A.adjoint == 0 %A*x
	img = idct2(reshape(x, [220 220]));  %check reshape
    res = radon(img, A.angles); % 315*18 = 5670
    res = reshape(res, [], 1);  %Check reshape
else %At*x
	radon_transforms = reshape(x, 315, 18);
	res = iradon(radon_transforms, A.angles, 220); %check output size
	res = reshape(dct2(res), [], 1); %Check reshape
end
