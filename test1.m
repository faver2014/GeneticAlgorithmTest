% test1Fx( x ) = 1 ./ ( x + 1 );
%rand     (0-1)�ڵ������
%randi(x)    ( 0 - x )�ڵ������
%���ۺ���Ϊf( x ) = 1 ./ test1Fx(x)
clear,clc 
close all
global NumSun;%�Ӵ�����
global LenNum;%������λ��
NumSun = 60;%�Ӵ�����
Pc = 0.7 ; %�������
Pm = 0.01; %�������
Precision = 0.01;%����
ItemNum = 2; %������
father = zeros(1,NumSun);%NumSun���Ӵ�
FitRate = zeros( 1 , NumSun );
SumFitRate = 0;%��Ӧ���ܺ�
DataMax = 31;%Ѱ�ű�������
DataMin = 0;%Ѱ�ű�������
LenNum = floor( log( ( DataMax - DataMin ) / Precision ) ) + 1;
sun = zeros( 1, NumSun );
%�������������һ��
for i = 1 : NumSun
    father( i ) = randi( power(2,LenNum) );
end
time = 100;

for iterator  = 1 : time
    father
    %������Ӧ��
    FitRate = 1 ./ test1Fx( father .* ((DataMax - DataMin)/(power(2,LenNum)-1)) + DataMin );
    %�����˳�����
    if iterator == time
        [ ~ , idx_tmp ] = max( FitRate );
        data_tmp = father(idx_tmp);
        data_x = data_tmp * ((DataMax - DataMin)/(power(2,LenNum)-1)) + DataMin
        data_output = test1Fx( data_x )
        break;
    end
    %��Ӧ���ܺ�
    
    SumFitRate = sum(FitRate);
    %ѡ�Ӵ�
    for i = 1 : NumSun 
        temp = rand();
        temp = temp * SumFitRate;
        idx = ChooseIdxFromFitRate( temp, FitRate );
        sun( i ) = father( idx );
    end
    'choose'
    sun
    %����
    for i = 1 : 2 : NumSun
        temp = rand();%�������������
        if temp < Pc 
           %����������ڽ�������ڣ�ִ�н���
           temp = randi( LenNum ); %��ý���λ
           temp2 = ExchangeGene( temp, sun( i ) , sun( i + 1 ) );
           sun( i ) = temp2( 1 ); 
           sun( i + 1 ) = temp2( 2 );
        end
    end
    'exchange'
    sun
    %����
    for i = 1 : NumSun
        temp = rand();%�������������
        if temp < Pm 
            'BitVariation'
            %���ڱ��������,ִ�б���
            temp = randi( LenNum ); %��ý���λ
            sun( i ) = BitVariation( temp, sun( i ) );
        end
    end
    father = sun;
end

'test plot'
x = 0 : 0.0001 : 32;
y = test1Fx(x);
plot( y )





