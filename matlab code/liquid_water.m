% convert_to_liquid_water.m

% 定义液态水与气态水的同位素分馏系数（1000 * lnα）
% 公式来自你的数据
function y_liquid_vapor = y_liquid_vapor_conversion(temp)
    % 确保你的温度 T 是开尔文（K）
    
    T_factor_3 = (temp.^3) ./ 1e9;
    T_factor_2 = (temp.^2) ./ 1e6;
    T_factor_1 = (temp) ./ 1e3;
    T_factor_neg3 = 1e9 ./ (temp.^3);
    
    y_liquid_vapor = 1158.8 .* T_factor_3 - 1620.1 .* T_factor_2 + ...
                     794.84 .* T_factor_1 - 161.04 + 2.9992 .* T_factor_neg3;

    y_liquid_vapor = y_liquid_vapor';
end

% --- 主脚本开始 ---

% 设置温度范围，与你之前计算时使用的保持一致
temp =linspace(273,373,1000);

% 步骤 1: 调用之前的函数，获取原始数据（相对于气态水）
% 结构体名称已简化
fprintf('正在加载并计算原始数据（相对于气态水）。..\n');
y_center = calculate_center();
y_average = calculate_average();
y_1 = calculate_1();
fprintf('原始数据加载完成。\n');

% 步骤 2: 计算液态水与气态水的 y 值
% 使用你定义的公式来获取转换因子
y_liquid_vapor_factor = y_liquid_vapor_conversion(temp);

% 步骤 3: 转换 center 数据
fprintf('正在转换 center 数据为液态水基准...\n');
y_center_liquid = struct();
center_fields = fieldnames(y_center);
for i = 1:length(center_fields)
    current_field = center_fields{i};
    
    % 获取原始 y 值
    y_data = y_center.(current_field);
    
    % 应用减法转换公式
    y_new = y_data - y_liquid_vapor_factor;
    
    % 保存结果到新结构体
    y_center_liquid.(current_field) = y_new;
end
fprintf('center 数据转换完成。\n');

% 步骤 4: 转换 average 数据
fprintf('正在转换 average 数据为液态水基准...\n');
y_average_liquid = struct();
average_fields = fieldnames(y_average);
for i = 1:length(average_fields)
    current_field = average_fields{i};
    
    % 获取原始 y 值
    y_data = y_average.(current_field);
    
    % 应用减法转换公式
    y_new = y_data - y_liquid_vapor_factor;
    
    % 保存结果到新结构体
    y_average_liquid.(current_field) = y_new;
end
fprintf('average 数据转换完成。\n');


% 步骤 4: 转换 average_1 数据
fprintf('正在转换 average 数据为液态水基准...\n');
y_1_liquid = struct();
y_1_liquid_fields = fieldnames(y_1);
for i = 1:length(average_fields)
    current_field = y_1_liquid_fields{i};
    
    % 获取原始 y 值
    y_data = y_1.(current_field);
    
    % 应用减法转换公式
    y_new = y_data - y_liquid_vapor_factor;
    
    % 保存结果到新结构体
    y_1_liquid.(current_field) = y_new;
end
