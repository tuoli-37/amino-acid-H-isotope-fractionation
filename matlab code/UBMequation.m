


function Qre=UBMequation(basefreq, isofreq, temp)  %basefreq:unsubstituted frequencies; isofreq:substituted frequencies; temp:temperature range
h=6.626e-34; %Planck's constant in kg m2 s-1;
k=1.3806e-23; %Boltzmann's constant in J K-1;
% the real part of frequencies
isofreq_real = isofreq(isofreq>0); 
% the imaginary part of freqs
isofreq_img = isofreq(isofreq<=0); 

c=2.99792e10; %light speed in cm/s;
if isfinite(prod(isofreq)) && isfinite(prod(basefreq))
    % 如果普通乘积计算没有溢出，使用原始方法
    Const = prod(isofreq) / prod(basefreq);
else
    % 如果出现inf，改用对数空间计算
    log_Const = sum(log(isofreq)) - sum(log(basefreq));
    Const = exp(log_Const);
    
    % 可选：显示警告信息
    warning('频率乘积溢出，已自动切换到对数空间计算。结果：Const = %g', Const);
end
R=zeros(length(basefreq),1);       %Ratios for each frequency

Qre=zeros(length(temp),1);

count=1;
for T=temp
    T_Real=T;
    R=exp(-h*c/k/2.*isofreq/T_Real)./(1-exp(-h*c/k.*isofreq/T_Real))./(exp(-h*c/k/2.*basefreq/T_Real)./(1-exp(-h*c/k.*basefreq/T_Real)));
    Qre(count)=Const*prod(R);
    count=count+1;
end
end

