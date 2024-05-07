% 设置目标尺寸
targetHeight = 250;
targetWidth = 250;

% 要处理的图像文件夹
imageFolder = 'C:\Users\Administrator\Desktop\图像处理\bm3d_matlab_package_3.0.9\bm3d_matlab_package\Picture';

% 读取图像文件列表
imageFiles = dir(fullfile(imageFolder, '*.jpg')); % 更改文件类型以匹配你的图片类型

% 循环处理每个图像
for i = 1:numel(imageFiles)
    % 读取图像
    img = imread(fullfile(imageFolder, imageFiles(i).name));
    
    % 确保图像是 RGB 格式
    if size(img, 3) == 1
        % 如果是灰度图像，则转换为 RGB
        img = cat(3, img, img, img);
    end
    
    % 将图像调整为目标尺寸
    imgResized = imresize(img, [targetHeight, targetWidth]);
    
    % 保存调整后的图像
    imwrite(imgResized, fullfile(imageFolder, ['resized_' imageFiles(i).name]));
end
