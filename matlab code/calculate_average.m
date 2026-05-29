function y_average = calculate_average()
% 此函数自动读取 'AA.xlsx' 表格，计算每个氨基酸的全分子y值，
% 并返回一个包含所有结果的结构体。

% 设置温度范围
temp =linspace(273,373,1000);

% 水分
basefreq_water = load('D:\project1\vib\H2O\H2O.txt');
isofreq_water = load('D:\project1\vib\H2O\H2O-1.txt');
Qre_water =  UBMequation(basefreq_water, isofreq_water, temp);

% 初始化结果结构体
y_average = struct();

% glycine (nH_total = 2)
basefreq = load('D:\project1\vibration\glycine.txt');
isofreq1 = load('D:\project1\vibration\glycine7.txt');
isofreq2 = load('D:\project1\vibration\glycine8.txt');
Qre_sum = UBMequation(basefreq, isofreq1, temp) + UBMequation(basefreq, isofreq2, temp);
Qre_average = Qre_sum / 2;
Qre_relative = Qre_average ./ Qre_water;
y_average.glycine = 1000 * log(Qre_relative(:, 1));

% L-alanine (nH_total = 4)
basefreq = load('D:\project1\vibration\L-alanine.txt');
isofreq1 = load('D:\project1\vibration\L-alanine11.txt');
isofreq2 = load('D:\project1\vibration\L-alanine7.txt');
isofreq3 = load('D:\project1\vibration\L-alanine9.txt');
isofreq4 = load('D:\project1\vibration\L-alanine10.txt');
Qre_sum = UBMequation(basefreq, isofreq1, temp) + UBMequation(basefreq, isofreq2, temp) + ...
          UBMequation(basefreq, isofreq3, temp) + UBMequation(basefreq, isofreq4, temp);
Qre_average = Qre_sum / 4;
Qre_relative = Qre_average ./ Qre_water;
y_average.L_alanine = 1000 * log(Qre_relative(:, 1));
Qre_unex=((UBMequation(basefreq, isofreq2, temp) + ...
          UBMequation(basefreq, isofreq3, temp) + UBMequation(basefreq, isofreq4, temp))/3)./Qre_water;
y_unex.L_alanine=1000 * log(Qre_unex(:, 1));

% L-proline (nH_total = 7)
basefreq = load('D:\project1\vib\L-proline\0-T.txt');
isofreq_paths = {'1-T.txt', '2-T.txt', '3-T.txt', '4-T.txt', '5-T.txt', '6-T.txt', '7-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\L-proline', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 7;
Qre_relative = Qre_average ./ Qre_water;
y_average.L_proline = 1000 * log(Qre_relative(:, 1));

% L-valine (nH_total = 8)
basefreq = load('D:\project1\vib\L-valine\0-T.txt');
isofreq_paths = {'2-T.txt', '3-T.txt', '4-T.txt', '5-T.txt', '6-T.txt', '7-T.txt', '8-T.txt', '9-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\L-valine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 8;
Qre_relative = Qre_average ./ Qre_water;
y_average.L_valine = 1000 * log(Qre_relative(:, 1));

% D-alanine (nH_total = 4)
basefreq = load('D:\project1\vibration\D-alanine.txt');
isofreq1 = load('D:\project1\vibration\D-alanine11.txt');
isofreq2 = load('D:\project1\vibration\D-alanine5.txt');
isofreq3 = load('D:\project1\vibration\D-alanine12.txt');
isofreq4 = load('D:\project1\vibration\D-alanine13.txt');
Qre_sum = UBMequation(basefreq, isofreq1, temp) + UBMequation(basefreq, isofreq2, temp) + ...
          UBMequation(basefreq, isofreq3, temp) + UBMequation(basefreq, isofreq4, temp);
Qre_average = Qre_sum / 4;
Qre_relative = Qre_average ./ Qre_water;
y_average.D_alanine = 1000 * log(Qre_relative(:, 1));

% D-proline (nH_total = 7)
basefreq = load('D:\project1\vib\D-proline\0-T.txt');
isofreq_paths = {'1-T.txt', '2-T.txt', '3-T.txt', '4-T.txt', '5-T.txt', '6-T.txt', '9-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\D-proline', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 7;
Qre_relative = Qre_average ./ Qre_water;
y_average.D_proline = 1000 * log(Qre_relative(:, 1));

% D-valine (nH_total = 8)
basefreq = load('D:\project1\vib\D-valine\0-T.txt');
isofreq_paths = {'2-T.txt', '3-T.txt', '4-T.txt', '5-T.txt', '6-T.txt', '7-T.txt', '8-T.txt', '9-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\D-valine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 8;
Qre_relative = Qre_average ./ Qre_water;
y_average.D_valine = 1000 * log(Qre_relative(:, 1));

% D-leucine (nH_total = 10)
basefreq = load('D:\project1\vib\D-leucine\0-T.txt');
isofreq_paths = {'1-T.txt', '2-T.txt', '3-T.txt', '4-T.txt', '5-T.txt', '6-T.txt', '7-T.txt', '8-T.txt', '9-T.txt', '10-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\D-leucine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 10;
Qre_relative = Qre_average ./ Qre_water;
y_average.D_leucine = 1000 * log(Qre_relative(:, 1));

% L-isoleucine (nH_total = 10)
basefreq = load('D:\project1\vib\L-isoleucine\0-T.txt');
isofreq_paths = {'2-T.txt', '3-T.txt', '4-T.txt', '5-T.txt', '6-T.txt', '7-T.txt', '8-T.txt', '9-T.txt', '10-T.txt', '11-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\L-isoleucine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 10;
Qre_relative = Qre_average ./ Qre_water;
y_average.L_isoleucine = 1000 * log(Qre_relative(:, 1));

% D-isoleucine (nH_total = 10)
basefreq = load('D:\project1\vib\D-isoleucine\0-T.txt');
isofreq_paths = {'1-T.txt', '2-T.txt', '3-T.txt', '4-T.txt', '5-T.txt', '6-T.txt', '7-T.txt', '8-T.txt', '9-T.txt', '10-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\D-isoleucine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 10;
Qre_relative = Qre_average ./ Qre_water;
y_average.D_isoleucine = 1000 * log(Qre_relative(:, 1));

% L-leucine (nH_total = 10)
basefreq = load('D:\project1\vib\L-leucine\0-T.txt');
isofreq_paths = {'2-T.txt', '3-T.txt', '4-T.txt', '5-T.txt', '6-T.txt', '7-T.txt', '8-T.txt', '9-T.txt', '10-T.txt', '11-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\L-leucine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 10;
Qre_relative = Qre_average ./ Qre_water;
y_average.L_leucine = 1000 * log(Qre_relative(:, 1));

% L-serine (nH_total = 3)
basefreq = load('D:\project1\vibration\L-serine.txt');
isofreq1 = load('D:\project1\vibration\L-serine11.txt');
isofreq2 = load('D:\project1\vibration\L-serine12.txt');
isofreq3 = load('D:\project1\vibration\L-serine13.txt');
Qre_sum = UBMequation(basefreq, isofreq1, temp) + UBMequation(basefreq, isofreq2, temp) + ...
          UBMequation(basefreq, isofreq3, temp) ;
Qre_average = Qre_sum / 3;
Qre_relative = Qre_average ./ Qre_water;
y_average.L_serine = 1000 * log(Qre_relative(:, 1));

% L-threonine (nH_total = 5)
basefreq = load('D:\project1\vib\L-threonine\0-T.txt');
isofreq_paths = {'1-T.txt', '2-T.txt', '7-T.txt', '8-T.txt', '9-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\L-threonine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 5;
Qre_relative = Qre_average ./ Qre_water;
y_average.L_threonine = 1000 * log(Qre_relative(:, 1));

% L-glutamine (nH_total = 7)
basefreq = load('D:\project1\vib\L-glutamine\0-T.txt');
isofreq_paths = {'2-T.txt', '3-T.txt', '4-T.txt', '5-T.txt', '6-T.txt', '7-T.txt', '8-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\L-glutamine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 7;
Qre_relative = Qre_average ./ Qre_water;
y_average.L_glutamine = 1000 * log(Qre_relative(:, 1));

% L-asparagine (nH_total = 3)
basefreq = load('D:\project1\vib\L-asparagine\0-T.txt');
isofreq_paths = {'2-T.txt', '3-T.txt', '4-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\L-asparagine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 3;
Qre_relative = Qre_average ./ Qre_water;
y_average.L_asparagine = 1000 * log(Qre_relative(:, 1));

% L-methionine (nH_total = 8)
basefreq = load('D:\project1\vib\L-metheonine\0-T.txt');
isofreq_paths = {'8-T.txt', '1-T.txt', '2-T.txt', '3-T.txt', '4-T.txt', '5-T.txt', '6-T.txt', '7-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\L-metheonine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 8;
Qre_relative = Qre_average ./ Qre_water;
y_average.L_methionine = 1000 * log(Qre_relative(:, 1));

% L-cysteine (nH_total = 4)
basefreq = load('D:\project1\vib\L-cysteine\0-T.txt');
isofreq_paths = {'2-T.txt', '3-T.txt', '4-T.txt', '5-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\L-cysteine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 4;
Qre_relative = Qre_average ./ Qre_water;
y_average.yL_cysteine = 1000 * log(Qre_relative(:, 1));

% D-serine (nH_total = 3)
basefreq = load('D:\project1\vibration\D-serine.txt');
isofreq1 = load('D:\project1\vibration\D-serine11.txt');
isofreq2 = load('D:\project1\vibration\D-serine12.txt');
isofreq3 = load('D:\project1\vibration\D-serine13.txt');
Qre_sum = UBMequation(basefreq, isofreq1, temp) + UBMequation(basefreq, isofreq2, temp) + ...
          UBMequation(basefreq, isofreq3, temp);
Qre_average = Qre_sum / 3;
Qre_relative = Qre_average ./ Qre_water;
y_average.D_serine = 1000 * log(Qre_relative(:, 1));

% D-threonine (nH_total = 5)
basefreq = load('D:\project1\vib\D-threonine\0-T.txt');
isofreq_paths = {'1-T.txt', '2-T.txt', '7-T.txt', '8-T.txt', '9-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\D-threonine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 5;
Qre_relative = Qre_average ./ Qre_water;
y_average.D_threonine = 1000 * log(Qre_relative(:, 1));

% D-glutamine (nH_total = 7)
basefreq = load('D:\project1\vib\D-glutamine\0-T.txt');
isofreq_paths = {'2-T.txt', '3-T.txt', '4-T.txt', '5-T.txt', '6-T.txt', '7-T.txt', '8-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\D-glutamine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 7;
Qre_relative = Qre_average ./ Qre_water;
y_average.D_glutamine = 1000 * log(Qre_relative(:, 1));

% D-asparagine (nH_total = 5)
basefreq = load('D:\project1\vib\D-asparagine\0-T.txt');
isofreq_paths = {'2-T.txt', '3-T.txt', '4-T.txt', '5-T.txt', '6-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\D-asparagine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 5;
Qre_relative = Qre_average ./ Qre_water;
y_average.D_asparagine = 1000 * log(Qre_relative(:, 1));

% D-methionine (nH_total = 8)
basefreq = load('D:\project1\vib\D-metheonine\0-T.txt');
isofreq_paths = {'11-T.txt', '1-T.txt', '2-T.txt', '3-T.txt', '4-T.txt', '5-T.txt', '6-T.txt', '7-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\D-metheonine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 8;
Qre_relative = Qre_average ./ Qre_water;
y_average.D_methionine = 1000 * log(Qre_relative(:, 1));

% D-cysteine (nH_total = 4)
basefreq = load('D:\project1\vib\D-cysteine\0-T.txt');
isofreq_paths = {'2-T.txt', '3-T.txt', '4-T.txt', '5-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\D-cysteine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 4;
Qre_relative = Qre_average ./ Qre_water;
y_average.D_cysteine = 1000 * log(Qre_relative(:, 1));

% L-Phenylalanine (nH_total = 10)
basefreq = load('D:\project1\vib\L-Phenylalanine\0-T.txt');
isofreq_paths = {'1-T.txt', '2-T.txt', '3-T.txt', '7-T.txt', '8-T.txt', '9-T.txt', '10-T.txt', '11-T.txt', '12-T.txt', '13-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\L-Phenylalanine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 10;
Qre_relative = Qre_average ./ Qre_water;
y_average.L_phenylalanine = 1000 * log(Qre_relative(:, 1));

% L-Tyrosine (nH_total = 7)
basefreq = load('D:\project1\vib\L-Tyrosine\0-T.txt');
isofreq_paths = {'2-T.txt', '3-T.txt', '4-T.txt', '5-T.txt', '6-T.txt', '7-T.txt', '8-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\L-Tyrosine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 7;
Qre_relative = Qre_average ./ Qre_water;
y_average.L_tyrosine = 1000 * log(Qre_relative(:, 1));

% L-Tryptophan (nH_total = 8)
basefreq = load('D:\project1\vib\L-Tryptophan\0-T.txt');
isofreq_paths = {'1-T.txt', '2-T.txt', '3-T.txt', '7-T.txt', '8-T.txt', '9-T.txt', '10-T.txt', '11-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\L-Tryptophan', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 8;
Qre_relative = Qre_average ./ Qre_water;
y_average.L_tryptophan = 1000 * log(Qre_relative(:, 1));

% D-Phenylalanine (nH_total = 10)
basefreq = load('D:\project1\vib\D-Phenylalanine\0-T.txt');
isofreq_paths = {'1-T.txt', '2-T.txt', '4-T.txt', '5-T.txt', '6-T.txt', '7-T.txt', '8-T.txt', '9-T.txt', '10-T.txt', '13-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\D-Phenylalanine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 10;
Qre_relative = Qre_average ./ Qre_water;
y_average.D_phenylalanine = 1000 * log(Qre_relative(:, 1));

% D-Tyrosine (nH_total = 7)
basefreq = load('D:\project1\vib\D-Tyrosine\0-T.txt');
isofreq_paths = {'2-T.txt', '3-T.txt', '4-T.txt', '5-T.txt', '6-T.txt', '7-T.txt', '8-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\D-Tyrosine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 7;
Qre_relative = Qre_average ./ Qre_water;
y_average.D_tyrosine = 1000 * log(Qre_relative(:, 1));

% D-Tryptophan (nH_total = 8)
basefreq = load('D:\project1\vib\D-Tryptophan\0-T.txt');
isofreq_paths = {'1-T.txt', '2-T.txt', '3-T.txt', '7-T.txt', '8-T.txt', '9-T.txt', '5-T.txt', '6-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\D-Tryptophan', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 8;
Qre_relative = Qre_average ./ Qre_water;
y_average.D_tryptophan = 1000 * log(Qre_relative(:, 1));

% L-aspartic acid (nH_total = 3)
basefreq = load('D:\project1\vib\L-asparticacid\0-T.txt');
isofreq_paths = {'2-T.txt', '3-T.txt', '4-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\L-asparticacid', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 3;
Qre_relative = Qre_average ./ Qre_water;
y_average.L_asparticacid = 1000 * log(Qre_relative(:, 1));

% L-glutamic acid (nH_total = 5)
basefreq = load('D:\project1\vib\L-glutamicacid\0-T.txt');
isofreq_paths = {'2-T.txt', '3-T.txt', '4-T.txt', '5-T.txt', '6-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\L-glutamicacid', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 5;
Qre_relative = Qre_average ./ Qre_water;
y_average.L_glutamicacid = 1000 * log(Qre_relative(:, 1));

% L-arginine (nH_total = 7)
basefreq = load('D:\project1\vib\L-arginine\0-T.txt');
isofreq_paths = {'2-T.txt', '3-T.txt', '4-T.txt', '5-T.txt', '6-T.txt', '7-T.txt', '8-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\L-arginine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 7;
Qre_relative = Qre_average ./ Qre_water;
y_average.L_arginine = 1000 * log(Qre_relative(:, 1));

% L-lysine (nH_total = 9)
basefreq = load('D:\project1\vib\L-lysine\0-T.txt');
isofreq_paths = {'2-T.txt', '3-T.txt', '4-T.txt', '5-T.txt', '6-T.txt', '7-T.txt', '8-T.txt', '9-T.txt','10-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\L-lysine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 9;
Qre_relative = Qre_average ./ Qre_water;
y_average.L_lysine = 1000 * log(Qre_relative(:, 1));

% D-aspartic acid (nH_total = 3)
basefreq = load('D:\project1\vib\D-asparcticacid\0-T.txt');
isofreq_paths = {'2-T.txt', '3-T.txt', '4-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\D-asparcticacid', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 3;
Qre_relative = Qre_average ./ Qre_water;
y_average.D_asparticacid = 1000 * log(Qre_relative(:, 1));

% D-glutamic acid (nH_total = 5)
basefreq = load('D:\project1\vib\D-glutamicacid\0-T.txt');
isofreq_paths = {'1-T.txt', '2-T.txt', '3-T.txt', '4-T.txt', '5-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\D-glutamicacid', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 5;
Qre_relative = Qre_average ./ Qre_water;
y_average.D_glutamicacid = 1000 * log(Qre_relative(:, 1));

% D-arginine (nH_total = 7)
basefreq = load('D:\project1\vib\D-arginine\0-T.txt');
isofreq_paths = {'2-T.txt', '3-T.txt', '4-T.txt', '5-T.txt', '6-T.txt', '7-T.txt', '8-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\D-arginine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 7;
Qre_relative = Qre_average ./ Qre_water;
y_average.D_arginine = 1000 * log(Qre_relative(:, 1));

% D-lysine (nH_total = 9)
basefreq = load('D:\project1\vib\D-lysine\0-T.txt');
isofreq_paths = {'1-T.txt', '2-T.txt', '3-T.txt', '4-T.txt', '5-T.txt', '6-T.txt', '7-T.txt', '8-T.txt', '9-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\D-lysine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 9;
Qre_relative = Qre_average ./ Qre_water;
y_average.D_lysine = 1000 * log(Qre_relative(:, 1));


% L-pyrrolysine (nH_total = 18)
basefreq = load('D:\project1\vib\L-pyrrolysine\0-T.txt');
isofreq_paths = { '2-T.txt', '3-T.txt', '4-T.txt', '7-T.txt', '8-T.txt', '9-T.txt', '10-T.txt', '11-T.txt', '12-T.txt', '14-T.txt', '15-T.txt', '16-T.txt','17-T.txt', '18-T.txt', '19-T.txt', '21-T.txt', '22-T.txt', '23-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\L-pyrrolysine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 18;
Qre_relative = Qre_average ./ Qre_water;
y_average.L_pyrrolysine = 1000 * log(Qre_relative(:, 1));


% D-pyrrolysine (nH_total = 18)
basefreq = load('D:\project1\vib\D-pyrrolysine\0-T.txt');
isofreq_paths = { '2-T.txt', '3-T.txt', '4-T.txt', '7-T.txt', '8-T.txt', '9-T.txt', '10-T.txt', '11-T.txt', '12-T.txt', '14-T.txt', '15-T.txt', '16-T.txt','17-T.txt', '18-T.txt', '19-T.txt', '21-T.txt', '22-T.txt', '23-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\D-pyrrolysine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 18;
Qre_relative = Qre_average ./ Qre_water;
y_average.D_pyrrolysine = 1000 * log(Qre_relative(:, 1));



%3-alanine n=4
basefreq = load('D:\project1\vib\3-alanine\0-T.txt');
isofreq_paths = {'1-T.txt', '2-T.txt', '3-T.txt', '4-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\3-alanine', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 4;
Qre_relative = Qre_average ./ Qre_water;
y_average.ala3 = 1000 * log(Qre_relative(:, 1));



%4-aminobutyricacid
basefreq = load('D:\project1\vib\4-aminobutyricacid\0-T.txt');
isofreq_paths = {'1-T.txt', '2-T.txt', '3-T.txt', '4-T.txt','5-T.txt','6-T.txt'};
Qre_sum = 0;
for p = 1:length(isofreq_paths)
    isofreq_data = load(fullfile('D:\project1\vib\4-aminobutyricacid', isofreq_paths{p}));
    Qre_sum = Qre_sum + UBMequation(basefreq, isofreq_data, temp);
end
Qre_average = Qre_sum / 6;
Qre_relative = Qre_average ./ Qre_water;
y_average.aminobutyricacid = 1000 * log(Qre_relative(:, 1));

end

