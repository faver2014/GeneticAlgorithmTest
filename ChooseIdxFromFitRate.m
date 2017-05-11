function Idx = ChooseIdxFromFitRate( curFitRate, AllFitRate )
global NumSun;%子代个数
Ladder = zeros(NumSun);
Ladder( 1 ) = AllFitRate( 1 );
for i = 2 : NumSun
    Ladder( i ) = Ladder( i - 1 ) + AllFitRate(i);
end
if curFitRate <= Ladder( 1 )
    Idx = 1;
    return;
end
for i = 2 : NumSun
    if( ( curFitRate > Ladder( i -1 ) ) && ...
        ( curFitRate <= Ladder( i ) ) )
    Idx = i;
    return;
    end
end