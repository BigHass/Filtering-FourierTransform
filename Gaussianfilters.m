%Gaussian low and high filter with cutoff frequency 10 
A=imread('image1.png');
s=size(A);
Lowfilter=zeros(s(1),s(2));
Highfilter=zeros(s(1),s(2));
B=fft2(A);
B=fftshift(B);
for i=1:s(1)
    for j=1:s(2)
        D=sqrt((i-s(1)/2+1)^2+(j-s(2)/2+1)^2);
        Lowfilter(i,j)=exp(-D^2/(2*10*10));
        Highfilter(i,j)=1-exp(-D^2/(2*10*10));
    end
end
C=Lowfilter.*B;%apply the Gaussian low pass filter  
C=fftshift(C);
AI1=ifft2(C);%find the inverse of image 
AI1=abs(AI1);%to remove a complex part
D=Highfilter.*B;%apply the Gaussian high pass filter on the image 
D=fftshift(D);
AI2=ifft2(D);%find the inverse of image
AI2=abs(AI2);%to remove a compliex part
figure(1), imshow(A);%to show image before apply filter
figure(2),imshow(AI1/max(AI1(:)));%to show image after apply filter
figure(3), imshow(Lowfilter);%to show Gaussian low pass filter
figure(4), imshow(AI2/max(AI2(:))); %to show image after apply Gaussian high pass filter
figure(5), imshow(Highfilter);%to show Gaussian high pass filter