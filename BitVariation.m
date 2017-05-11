function output = BitVariation( idx, data )

%如果idx为5，则截取的低位为bit:1-5
global LenNum;%二进制位长
%  LenNum = 12;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%临时测试所用
scale = [];  %二进制矩阵转换为十进制数的相乘矩阵因子
for i = 1 : LenNum
    scale = [ power( 2 , i - 1 ) scale ];
end

% input1Bits = bitget ( uint32(input1) ,LenNum:-1:1)   %测试用
% input2Bits = bitget ( uint32(input2) ,LenNum:-1:1)   %测试用
idx = uint32(idx);
inputBits = bitget ( uint32(data) ,LenNum:-1:1);
[ ~ ,theV ] = size(inputBits);

if inputBits(theV + 1 - idx ) == 1
    inputBits(theV + 1 - idx ) = 0;
else
    inputBits(theV + 1 - idx ) = 1;
end
output = sum( double(inputBits) .* scale );
