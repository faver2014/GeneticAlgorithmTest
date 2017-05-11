function output = ExchangeGene( idx, input1, input2 )
%如果idx为5，则截取的低位为bit:1-5
global LenNum;%二进制位长
% LenNum = 12;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%临时测试所用
scale = [];  %二进制矩阵转换为十进制数的相乘矩阵因子
for i = 1 : LenNum
    scale = [ power( 2 , i - 1 ) scale ];
end

% input1Bits = bitget ( uint32(input1) ,LenNum:-1:1)   %测试用
% input2Bits = bitget ( uint32(input2) ,LenNum:-1:1)   %测试用

input1BitsH = bitget ( uint32(input1) ,LenNum:-1:idx + 1);
input1BitsL = bitget ( uint32(input1) ,idx:-1:1);
input2BitsH = bitget ( uint32(input2) ,LenNum:-1:idx + 1);
input2BitsL = bitget ( uint32(input2) ,idx:-1:1);
output1 = [ input1BitsH input2BitsL ];
output2 = [ input2BitsH input1BitsL ];
output(1) = sum( double(output1) .* scale );
output(2) = sum( double(output2) .* scale );

