function res = mtimes(A,x)

	radon_transforms = reshape(x(1:5670), 315, 18);
	res1 = iradon(radon_transforms, A.angles1, 220); %check output size
	res1 = reshape(dct2(res1), [], 1); %Check reshape
	
	radon_transforms = reshape(x(5671:2*5670), 315, 18);
	res2 = iradon(radon_transforms, A.angles2, 220); %check output size
	res2 = reshape(dct2(res2), [], 1); %Check reshape
	res = [res1; (res2 - res1)]; 
end
