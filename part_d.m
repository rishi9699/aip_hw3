angles1 = 179*rand(1, 18);
angles2 = 179*rand(1, 18);
angles3 = 179*rand(1, 18);


brain_slice1 = imread('slice_50.png');
brain_slice2 = imread('slice_51.png');
brain_slice3 = imread('slice_52.png');

padded_img1 = idct2(dct2(brain_slice1, [220 220]));
padded_img2 = idct2(dct2(brain_slice2, [220 220]));
padded_img3 = idct2(dct2(brain_slice3, [220 220]));

y1 = reshape(radon(padded_img1, angles1), [], 1);
y2 = reshape(radon(padded_img2, angles2), [], 1);
y3 = reshape(radon(padded_img3, angles3), [], 1);

y=[y1;y2;y3];

A = A_CS3(angles1, angles2, angles3);
At = At_CS3(angles1, angles2, angles3);

m = 5670*3;
n = 48400*3;

lambda = 1; % regularization parameter
rel_tol = 0.1; % relative target duality gap

[x,status] = l1_ls(A,At,m,n,y,lambda,rel_tol);

figure
imshow(uint8(idct2(reshape(x(1:48400), [220 220]))))
figure
imshow(uint8(idct2(reshape(x(48401:2*48400) + x(1:48400) , [220 220]))))
figure
imshow(uint8(idct2(reshape(x(96801:3*48400) + x(1:48400), [220 220]))))
