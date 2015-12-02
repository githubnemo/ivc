#include "colors.inc"
#include "skies.inc"

#macro Title()
#local LetterStartPosition = 3.5;
#local Letter_XAxis_Start = -1;
#local Letter_XAxis_Offset = 0.55;
#local Letter_F_MoveTime = 1;
#local Letter_i_MoveTime = 2;
#local Letter_s_MoveTime = 3;
#local Letter_h_MoveTime = 4;
#local Letter_T_MoveTime = 5;
#local Letter_a_MoveTime = 6;
#local Letter_n_MoveTime = 7;
#local Letter_k_MoveTime = 8;

    camera{location<1,1,1> look_at<1,1,4> angle 90}
    light_source{<500,500,-1000> White*0.3}
    
    plane{<0,-1.4,0.5>,4.3 texture { pigment{SeaGreen} finish{reflection 0.35 specular 1} normal {ripples .35 turbulence .5 scale .25}}}
    
    #if(clock < Letter_F_MoveTime)
        #declare i=LetterStartPosition - clock*2.5;
        text{ ttf "timrom.ttf" "F" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start,i,4>} 
    #end
    
    #if(clock >= Letter_F_MoveTime & clock < Letter_i_MoveTime)
        #declare i=LetterStartPosition - (clock-Letter_F_MoveTime)*2.5;
        text{ ttf "timrom.ttf" "F" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start,1,4>}
        text{ ttf "timrom.ttf" "i" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+Letter_XAxis_Offset,i,4>} 
    #end
    
    #if(clock >= Letter_i_MoveTime & clock < Letter_s_MoveTime)
        #declare i=LetterStartPosition - (clock-Letter_i_MoveTime)*2.5;
        text{ ttf "timrom.ttf" "F" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start,1,4>}                     
        text{ ttf "timrom.ttf" "i" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+Letter_XAxis_Offset,1,4>} 
        text{ ttf "timrom.ttf" "s" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+1.5*Letter_XAxis_Offset,i,4>} 
    #end
    
    #if(clock >= Letter_s_MoveTime & clock < Letter_h_MoveTime)
        #declare i=LetterStartPosition - (clock-Letter_s_MoveTime)*2.5;
        text{ ttf "timrom.ttf" "F" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start,1,4>}                     
        text{ ttf "timrom.ttf" "i" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+Letter_XAxis_Offset,1,4>} 
        text{ ttf "timrom.ttf" "s" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+1.5*Letter_XAxis_Offset,1,4>} 
        text{ ttf "timrom.ttf" "h" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+2.1*Letter_XAxis_Offset,i,4>}
    #end
    
    #if(clock >= Letter_h_MoveTime & clock < Letter_T_MoveTime)
        #declare i=LetterStartPosition - (clock-Letter_h_MoveTime)*2.5;
        text{ ttf "timrom.ttf" "F" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start,1,4>}                     
        text{ ttf "timrom.ttf" "i" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+Letter_XAxis_Offset,1,4>} 
        text{ ttf "timrom.ttf" "s" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+1.5*Letter_XAxis_Offset,1,4>} 
        text{ ttf "timrom.ttf" "h" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+2.1*Letter_XAxis_Offset,1,4>}
        text{ ttf "timrom.ttf" "t" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+3.0*Letter_XAxis_Offset,i,4>}
    #end
    
    #if(clock >= Letter_T_MoveTime & clock < Letter_a_MoveTime)
        #declare i=LetterStartPosition - (clock-Letter_T_MoveTime)*2.5;
        text{ ttf "timrom.ttf" "F" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start,1,4>}                     
        text{ ttf "timrom.ttf" "i" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+Letter_XAxis_Offset,1,4>} 
        text{ ttf "timrom.ttf" "s" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+1.5*Letter_XAxis_Offset,1,4>} 
        text{ ttf "timrom.ttf" "h" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+2.1*Letter_XAxis_Offset,1,4>}
        text{ ttf "timrom.ttf" "t" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+3.0*Letter_XAxis_Offset,1,4>}
        text{ ttf "timrom.ttf" "a" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+3.6*Letter_XAxis_Offset,i,4>}
    #end
    
     #if(clock >= Letter_a_MoveTime & clock < Letter_n_MoveTime)
        #declare i=LetterStartPosition - (clock-Letter_a_MoveTime)*2.5;
        text{ ttf "timrom.ttf" "F" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start,1,4>}                     
        text{ ttf "timrom.ttf" "i" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+Letter_XAxis_Offset,1,4>} 
        text{ ttf "timrom.ttf" "s" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+1.5*Letter_XAxis_Offset,1,4>} 
        text{ ttf "timrom.ttf" "h" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+2.1*Letter_XAxis_Offset,1,4>}
        text{ ttf "timrom.ttf" "t" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+3.0*Letter_XAxis_Offset,1,4>}
        text{ ttf "timrom.ttf" "a" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+3.6*Letter_XAxis_Offset,1,4>}
        text{ ttf "timrom.ttf" "n" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+4.3*Letter_XAxis_Offset,i,4>}
    #end
    
     #if(clock >= Letter_n_MoveTime & clock < Letter_k_MoveTime)
        #declare i=LetterStartPosition - (clock-Letter_n_MoveTime)*2.5;
        text{ ttf "timrom.ttf" "F" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start,1,4>}                     
        text{ ttf "timrom.ttf" "i" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+Letter_XAxis_Offset,1,4>} 
        text{ ttf "timrom.ttf" "s" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+1.5*Letter_XAxis_Offset,1,4>} 
        text{ ttf "timrom.ttf" "h" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+2.1*Letter_XAxis_Offset,1,4>}
        text{ ttf "timrom.ttf" "t" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+3.0*Letter_XAxis_Offset,1,4>}
        text{ ttf "timrom.ttf" "a" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+3.6*Letter_XAxis_Offset,1,4>}
        text{ ttf "timrom.ttf" "n" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+4.3*Letter_XAxis_Offset,1,4>}
        text{ ttf "timrom.ttf" "k" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+5.2*Letter_XAxis_Offset,i,4>}
    #end
    
    #if(clock >= Letter_k_MoveTime)
        text{ ttf "timrom.ttf" "F" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start,1,4>}                     
        text{ ttf "timrom.ttf" "i" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+Letter_XAxis_Offset,1,4>} 
        text{ ttf "timrom.ttf" "s" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+1.5*Letter_XAxis_Offset,1,4>} 
        text{ ttf "timrom.ttf" "h" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+2.1*Letter_XAxis_Offset,1,4>}
        text{ ttf "timrom.ttf" "t" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+3.0*Letter_XAxis_Offset,1,4>}
        text{ ttf "timrom.ttf" "a" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+3.6*Letter_XAxis_Offset,1,4>}
        text{ ttf "timrom.ttf" "n" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+4.3*Letter_XAxis_Offset,1,4>}
        text{ ttf "timrom.ttf" "k" 0.03,0 pigment {BrightGold} finish {reflection 0.25 specular 1} translate <Letter_XAxis_Start+5.2*Letter_XAxis_Offset,1,4>}
    #end
sky_sphere {S_Cloud5}
#end