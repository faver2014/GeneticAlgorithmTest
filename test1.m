% test1Fx( x ) = 1 ./ ( x + 1 );
%rand     (0-1)内的随机数
%randi(x)    ( 0 - x )内的随机数
%代价函数为f( x ) = 1 ./ test1Fx(x)
clear,clc 
close all
global NumSun;%子代个数
global LenNum;%二进制位长
NumSun = 60;%子代个数
Pc = 0.7 ; %交叉概率
Pm = 0.01; %变异概率
Precision = 0.01;%精度
ItemNum = 2; %迭代数
father = zeros(1,NumSun);%NumSun个子代
FitRate = zeros( 1 , NumSun );
SumFitRate = 0;%适应度总和
DataMax = 31;%寻优变量上限
DataMin = 0;%寻优变量下限
LenNum = floor( log( ( DataMax - DataMin ) / Precision ) ) + 1;
sun = zeros( 1, NumSun );
%生成随机数，第一代
for i = 1 : NumSun
    father( i ) = randi( power(2,LenNum) );
end
time = 100;

for iterator  = 1 : time
    father
    %计算适应度
    FitRate = 1 ./ test1Fx( father .* ((DataMax - DataMin)/(power(2,LenNum)-1)) + DataMin );
    %条件退出迭代
    if iterator == time
        [ ~ , idx_tmp ] = max( FitRate );
        data_tmp = father(idx_tmp);
        data_x = data_tmp * ((DataMax - DataMin)/(power(2,LenNum)-1)) + DataMin
        data_output = test1Fx( data_x )
        break;
    end
    %适应度总和
    
    SumFitRate = sum(FitRate);
    %选子代
    for i = 1 : NumSun 
        temp = rand();
        temp = temp * SumFitRate;
        idx = ChooseIdxFromFitRate( temp, FitRate );
        sun( i ) = father( idx );
    end
    'choose'
    sun
    %交叉
    for i = 1 : 2 : NumSun
        temp = rand();%获得随机交叉概率
        if temp < Pc 
           %随机概率落在交叉概率内，执行交叉
           temp = randi( LenNum ); %获得交叉位
           temp2 = ExchangeGene( temp, sun( i ) , sun( i + 1 ) );
           sun( i ) = temp2( 1 ); 
           sun( i + 1 ) = temp2( 2 );
        end
    end
    'exchange'
    sun
    %变异
    for i = 1 : NumSun
        temp = rand();%获得随机变异概率
        if temp < Pm 
            'BitVariation'
            %落在变异概率内,执行变异
            temp = randi( LenNum ); %获得交叉位
            sun( i ) = BitVariation( temp, sun( i ) );
        end
    end
    father = sun;
end

'test plot'
x = 0 : 0.0001 : 32;
y = test1Fx(x);
plot( y )





