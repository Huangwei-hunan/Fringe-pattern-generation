%三频外差法条纹图片生成程序
%默认横条纹和竖条纹各12张，三频四移
%频率采用最小公倍数法产生,f1=n^2,f2=n(n-1),f3=(n-1)^2;
%λ=1/f
%公式和论文中有所区别，本程序的条纹个数可以根据分辨率来调节
clc;
close all;
clear;
%% 初始值
n=9;
picture_bit=8;%图片位数
K=4;%相移步数
width=1920;
height=1080;

f1=n*n
f2=n*(n-1)
f3=(n-1)*(n-1)
f=[f1,f2,f3];%三频

num =0;%图片后缀名

%% 横条纹
for i=1:size(f,2)
    for j=1:K
        eval(['image',num2str(num),'=zeros(height,width);'])
        for n=1:height
            eval(['image',num2str(num),'(n,:)=round((2^(picture_bit)-1)*(0.5+0.5*cos(2*pi*f',num2str(i),'*(n-1)/height+2*pi*(j-1)/K)));']);
        end
        num=num+1;
    end
end
%% 竖条纹
for i=1:size(f,2)
    for j=1:K
        eval(['image',num2str(num),'=zeros(height,width);']);
        for n=1:width
            eval(['image',num2str(num),'(:,n)=round((2^(picture_bit)-1)*(0.5+0.5*cos(2*pi*f',num2str(i),'*(n-1)/width+2*pi*(j-1)/K)));']);
        end
        num=num+1;
    end
end

%% 全白
eval(['image',num2str(num),'=255*ones(height,width);']);

%% 显示
figure
imshow(uint8(image0));
figure
imshow(uint8(image23));

%% 保存
for i=0:num
    string=['image',num2str(i),'.bmp'];
    eval(['image=uint8(image',num2str(i),');'])
    imwrite(image,string);
end




