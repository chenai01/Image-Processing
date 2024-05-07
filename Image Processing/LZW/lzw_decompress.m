function decompressed_data = lzw_decompress(compressed_data)
    dictionary = {};
    dict_size = 256; % 初始字典大小
    for i = 0:255
        dictionary{i+1} = char(i); % 初始化字典
    end

    current_code = compressed_data(1) + 1;
    decompressed_data = dictionary{current_code};

    for i = 2:length(compressed_data)
        prev_code = current_code;
        current_code = compressed_data(i) + 1;

        if current_code <= length(dictionary)
            entry = dictionary{current_code};
        elseif current_code == length(dictionary) + 1
            entry = [dictionary{prev_code}, dictionary{prev_code}(1)];
        else
            error('Invalid compressed data');
        end

        decompressed_data = [decompressed_data, entry];

        dictionary{end+1} = [dictionary{prev_code}, entry(1)]; % 添加新条目到字典
    end
end
