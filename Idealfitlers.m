% Ideal low pass filter and ideal high pass with cutoff = 30 
A =imread('image1.png');
s=size(A);
Lowfilter=zeros(s(1), s(2));%create the low pass filter
Highfilter=zeros(s(1),s(2));%create the high pass filter
B=fft2(A);
B=fftshift(B);%put the DC component on center
for i=1:s(1)
    for j=1:s(2)
        D=sqrt((i-s(1)/2 +1)^2+(j-s(2)/2 + 1)^2);
        if D<30
            Lowfilter(i,j)=1;
        end
        if D>30
            Highfilter(i,j)=1;
        end
    end
end
C=Lowfilter.*B;%apply the ideal low pass filter 
C=fftshift(C);
AI1=ifft2(C);%find the inverse of image 
AI1=abs(AI1);%to remove a complex part
D=Highfilter.*B;%apply the ideal high pass filter on the image 
D=fftshift(D);
AI2=ifft2(D);%find the inverse of image
AI2=abs(AI2);%to remove a complex part
figure(1), imshow(A);%to show image before apply filter
figure(2),imshow(AI1/max(AI1(:)));%to show image after apply filter
figure(3), imshow(Lowfilter);%to show ideal low pass filter
figure(4), imshow(AI2/max(AI2(:))); %to show image after apply ideal high pass filter
figure(5), imshow(Highfilter);%to show ideal high pass filter