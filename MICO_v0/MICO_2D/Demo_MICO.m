clc;close all;clear all;
iterNum = 10;
N_region=3;  q=1;
Img=imread('C:\Users\Administrator\Desktop\brain.tif');
%Img=imread('mprage77.tif');
Img = double(Img(:,:,1)); 
%load ROI
A=255;
Img_original = Img;
[nrow,ncol] = size(Img);n = nrow*ncol;
ROI = (Img>5); ROI = double(ROI);

tic

Bas=getBasisOrder3(nrow,ncol);
N_bas=size(Bas,3);
for ii=1:N_bas
    ImgG{ii} = Img.*Bas(:,:,ii).*ROI;
    for jj=ii:N_bas
        GGT{ii,jj} = Bas(:,:,ii).*Bas(:,:,jj).*ROI;
        GGT{jj,ii} = GGT{ii,jj} ;
    end
end


energy_MICO = zeros(3,iterNum);

b=ones(size(Img));
for ini_num = 1:1
    C=rand(3,1);
    C=C*A;
    M=rand(nrow,ncol,3);
    a=sum(M,3);
    for k = 1 : N_region
        M(:,:,k)=M(:,:,k)./a;
    end
    
    [e_max,N_max] = max(M,[], 3);
    for kk=1:size(M,3)
        M(:,:,kk) = (N_max == kk);
    end
    
    M_old = M; chg=10000;
    energy_MICO(ini_num,1) = get_energy(Img,b,C,M,ROI,q);
    
    
    for n = 2:iterNum
        pause(0.1)
        
        [M, b, C]=  MICO(Img,q,ROI,M,C,b,Bas,GGT,ImgG,1, 1);
        energy_MICO(ini_num,n) = get_energy(Img,b,C,M,ROI,q);
        
        figure(2),
        if(mod(n,1) == 0)
            PC=zeros(size(Img));
            for k = 1 : N_region
                PC=PC+C(k)*M(:,:,k);
            end
            subplot(241),imshow(uint8(Img)),title('原始图像')
            subplot(242),imshow(PC.*ROI,[]); colormap(gray);
            iterNums=['分割: ',num2str(n), ' 迭代'];
            title(iterNums);
            subplot(243),imshow(b.*ROI,[]),title('偏差场')
            img_bc = Img./b;  % bias field corrected image
            subplot(244),imshow(uint8(img_bc.*ROI),[]),title('校正图像')
            subplot(2,4,[5 6 7 8]),plot(energy_MICO(ini_num,:))
            xlabel('迭代次数');
            ylabel('能量');
            pause(0.1)
        end
    end
end

[M,C]=sortMemC(M,C);
seg=zeros(size(Img));
for k = 1 : N_region
    seg=seg+k*M(:,:,k);   % label the k-th region 
end
figure;
subplot(131),imshow(Img,[]),title('初始图像')
subplot(132),imshow(b.*ROI,[]),title('偏差场')
subplot(133),imshow(uint8(img_bc.*ROI),[]),title('偏差场校正的图像')



