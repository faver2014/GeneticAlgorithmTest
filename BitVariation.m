function output = BitVariation( idx, data )

%���idxΪ5�����ȡ�ĵ�λΪbit:1-5
global LenNum;%������λ��
%  LenNum = 12;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��ʱ��������
scale = [];  %�����ƾ���ת��Ϊʮ����������˾�������
for i = 1 : LenNum
    scale = [ power( 2 , i - 1 ) scale ];
end

% input1Bits = bitget ( uint32(input1) ,LenNum:-1:1)   %������
% input2Bits = bitget ( uint32(input2) ,LenNum:-1:1)   %������
idx = uint32(idx);
inputBits = bitget ( uint32(data) ,LenNum:-1:1);
[ ~ ,theV ] = size(inputBits);

if inputBits(theV + 1 - idx ) == 1
    inputBits(theV + 1 - idx ) = 0;
else
    inputBits(theV + 1 - idx ) = 1;
end
output = sum( double(inputBits) .* scale );
