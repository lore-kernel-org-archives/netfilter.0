From: "sword" <gbj@glc.cn.net>
Subject: a question about user-defined chain
Date: Thu, 5 Jun 2003 16:32:23 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E19NqBN-0007eh-00@kashyyyk.netfilter.org>
Reply-To: gbj@glc.cn.net
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org, netfilter@lists.netfilter.org

   we all know that user can define chains he want,question is: which chain  will match ip packet first? In netfilter ,kernel decide to which chain the ip packet will send by where ip packet issued and where it send to,so the chain INPUT,OUTPUT,FORWARD will select to process ip packet,so what about user-defined chain?   


          sword

         gbj@glc.cn.net

begin 600 FACE-6.GIF
M1TE&.#EA(``@`/?8`/______S/__F?__9O__,___`/_,___,S/_,F?_,9O_,
M,__,`/^9__^9S/^9F?^99O^9,_^9`/]F__]FS/]FF?]F9O]F,_]F`/\S__\S
MS/\SF?\S9O\S,_\S`/\`__\`S/\`F?\`9O\`,_\``,S__\S_S,S_F<S_9LS_
M,\S_`,S,_\S,S,S,F<S,9LS,,\S,`,R9_\R9S,R9F<R99LR9,\R9`,QF_\QF
MS,QFF<QF9LQF,\QF`,PS_\PSS,PSF<PS9LPS,\PS`,P`_\P`S,P`F<P`9LP`
M,\P``)G__YG_S)G_F9G_9IG_,YG_`)G,_YG,S)G,F9G,9IG,,YG,`)F9_YF9
MS)F9F9F99IF9,YF9`)EF_YEFS)EFF9EF9IEF,YEF`)DS_YDSS)DSF9DS9IDS
M,YDS`)D`_YD`S)D`F9D`9ID`,YD``&;__V;_S&;_F6;_9F;_,V;_`&;,_V;,
MS&;,F6;,9F;,,V;,`&:9_V:9S&:9F6:99F:9,V:9`&9F_V9FS&9FF69F9F9F
M,V9F`&8S_V8SS&8SF68S9F8S,V8S`&8`_V8`S&8`F68`9F8`,V8``#/__S/_
MS#/_F3/_9C/_,S/_`#/,_S/,S#/,F3/,9C/,,S/,`#.9_S.9S#.9F3.99C.9
M,S.9`#-F_S-FS#-FF3-F9C-F,S-F`#,S_S,SS#,SF3,S9C,S,S,S`#,`_S,`
MS#,`F3,`9C,`,S,```#__P#_S`#_F0#_9@#_,P#_``#,_P#,S`#,F0#,9@#,
M,P#,``"9_P"9S`"9F0"99@"9,P"9``!F_P!FS`!FF0!F9@!F,P!F```S_P`S
MS``SF0`S9@`S,P`S````_P``S```F0``9@``,P```/___P``````````````
M````````````````````````````````````````````````````````````
M````````````````````````````````````````````````````````````
M`````````````````````"'_"TY%5%-#05!%,BXP`P$````A^00%'@#8`"P`
M````(``@```(_P`!`$A4IJ#!@P@3'A3($(#"AP8?&21HL"%%B`HOSDHH$./#
M1!O+/-IXL6!)D0=/HB09,B1$C1-GM00YRPO(1RH/SBPXZY&7&5YF@4PT8\8L
M!#-`FDPHM&>BD0BB!DWT,VJ9J$AMHD0X<I;1HUC#BL5J--$UB0BI`HU:U,O8
MMST[IOUI4Z;7&6.+XHTJ5*Y.O8#S(D+D].<LAF:O&=R+P.8C1(R10M;+UII%
MK52C$ETQBT58O5Y"NT60J.'`I"(9VVPU6G-1%C6QEK9XP&9KI$7%)LJ:F;3I
M@0>21GY+^NULVKF)*Y?]>R#1Y6%WZVXN?7GUZLRI#Q>;-)'WL<=_/TB'3CR\
M::+;R9O_7>8V6YO>U49OWK#,>/*:Z9MN_Q:H>]_Z,735?^4%:)%4ZAEXH%38
M3:<@8KHU"."#`DE(6GSQ4>@<?A?J%Q``(?D$!1X`V``L"``)`!0`!P``"#8`
ML0D4B`#!P(,(!\Z:E;#AP$0)9S@\.*.BQ1D&)U8DB.UB1(L'O6#S(G)C2)$B
*#Q;,B'`ERX``.\
`
end



