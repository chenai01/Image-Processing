function compressed_data = lzw_compress(input_data)
    dictionary = {};
    dict_size = 256; % 初始字典大小
    for i = 0:255
        dictionary{i+1} = char(i); % 初始化字典
    end

    compressed_data = [];
    current_code = '';

    for i = 1:length(input_data)
        symbol = input_data(i);
        new_code = [current_code, symbol];
        if ismember(new_code, dictionary) % 如果新代码已经在字典中
            current_code = new_code;
        else
            compressed_data = [compressed_data, find(strcmp(dictionary, current_code))-1];
            dictionary{end+1} = new_code; % 添加新代码到字典中
            current_code = symbol;
        end
    end

    if ~isempty(current_code)
        compressed_data = [compressed_data, find(strcmp(dictionary, current_code))-1];
    end
end
