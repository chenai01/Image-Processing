% input_data = 'abbababac'; % 输入数据
s1='Along with the development of society, more and more problems are brought to our attention, one of the most serious issue is the gray population. Nevertheless, the significance of elderly people in society cannot be overstated. As the population ages, it is imperative that we acknowledge and appreciate the contributions and wisdom of our elderly citizens.';
s2='Firstly, elderly people possess a wealth of knowledge and life experience that are invaluable to the younger generations. Their wisdom, acquired through years of living and learning, provides a unique perspective on life and offers guidance to the younger members of society. By recognizing and appreciating the significance of elderly people, we can tap into their extensive expertise and experience ,and benefit from their insights, thus enriching our whole communities.';
s3='Secondly, elderly people have made significant contributions to society throughout their lives, and it is fair and just that we honor and respect their efforts. Many elderly citizens have dedicated their time and energy to building and shaping the world we live in today, whether through their work, their families, or their community involvement. By recognizing and appreciating the significance of elderly people, we acknowledge and show gratitude for their past contributions, to guarantee that they are not marginalized or forgotten in their later years.';
s4='In addition, recognizing the significance of elderly people helps to combat ageism and promote a culture of inclusiveness and respect. Too often, elderly individuals are subjected to discrimination, neglect, and social isolation, which can have detrimental effects on their well-being and mental health. By valuing and honoring the elderly, we can create a more compassionate and supportive society that values the dignity and worth of all its members, regardless of age.';
s5='In conclusion, recognizing the significance of elderly people is essential for building a harmonious and just society. By acknowledging their wisdom, honoring their contributions, and combating ageism, we can create a more inclusive and respectful community that benefits every generation in our society.';
% input_data=strcat(s1,s2,s3,s4,s5);
input_data1=s1;
input_data2=strcat(s1,s2);
input_data3=strcat(s1,s2,s3);
input_data4=strcat(s1,s2,s3,s4);
input_data5=strcat(s1,s2,s3,s4,s5);
rate=zeros(1,5);
data={input_data1;input_data2;input_data3;input_data4;input_data5};
for i=1:5
    compressed_data = lzw_compress(data{i}); % 压缩数据
    rate(i)=length(compressed_data)/length(data{i})
end


plot(1:5,rate)
xlabel("段落数")
ylabel("压缩率")
xticks(1:5)
title("不同段落下压缩率")

% % 打开文件以写入模式
% fid = fopen('output.txt', 'w');
% 
% % 将字符串写入文件
% fprintf(fid, '%s\n', string(compressed_data'));
% 
% % 关闭文件
% fclose(fid);

% compressed_data = [compressed_data]; % 压缩数据，例如[1, 2, 3, 4, ...]
% decompressed_data = lzw_decompress(compressed_data); % 解压缩数据
% disp(decompressed_data); % 显示解压缩后的数据
