function output = ExchangeGene( idx, input1, input2 )
%���idxΪ5�����ȡ�ĵ�λΪbit:1-5
global LenNum;%������λ��
% LenNum = 12;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��ʱ��������
scale = [];  %�����ƾ���ת��Ϊʮ����������˾�������
for i = 1 : LenNum
    scale = [ power( 2 , i - 1 ) scale ];
end

% input1Bits = bitget ( uint32(input1) ,LenNum:-1:1)   %������
% input2Bits = bitget ( uint32(input2) ,LenNum:-1:1)   %������

input1BitsH = bitget ( uint32(input1) ,LenNum:-1:idx + 1);
input1BitsL = bitget ( uint32(input1) ,idx:-1:1);
input2BitsH = bitget ( uint32(input2) ,LenNum:-1:idx + 1);
input2BitsL = bitget ( uint32(input2) ,idx:-1:1);
output1 = [ input1BitsH input2BitsL ];
output2 = [ input2BitsH input1BitsL ];
output(1) = sum( double(output1) .* scale );
output(2) = sum( double(output2) .* scale );

