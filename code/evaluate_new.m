% path = 'E:\Dehazing\SOTS\nyuhaze500';
path = 'E:\Dehazing\SOTS\outdoor';
% path = 'E:\Dehazing\HSTS\synthetic';

% imgDir = dir([path '\synthetic\*.jpg']); % ��������jpg��ʽ�ļ�
% imgDir = dir([path '\hazy\*.png']); % ��������jpg��ʽ�ļ� png jpg
imgDir = dir([path '\hazy\*.jpg']); % ��������jpg��ʽ�ļ� png jpg
psnr_list = zeros(1,500);
% psnr_sum =  21.1635*35;
psnr_sum =  0;
index = 160;
for i = index + 1:length(imgDir) % �����ṹ��Ϳ���һһ����ͼƬ��
    if i <= index
        continue
    end
    img = imread([path '\hazy\' imgDir(i).name]); %��ȡÿ��ͼƬ synthetic hazy
%     img = imresize([140,140]);
    result = im2double(IIDCP(img));
    
    gt_name = [imgDir(i).name(1:4) '.png']; % png
    gt = im2double(imread([path '\gt\' gt_name])); %��ȡÿ��ͼƬ original gt
    
%     gt = gt(11:470,11:630,:);
    
    psnr_curr = psnr(result,gt);
    psnr_list(1,i) = psnr_curr;
    psnr_sum = psnr_sum + psnr_curr;
    psnr_sum / (i - index)
    figure(2),imshow(result);
    figure(1),imshow(gt);
end

% 21.1348 20.7388 22.0976 
% 22.9858
% 21.3679
