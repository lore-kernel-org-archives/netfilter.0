From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: TEE target
Date: Thu, 15 Nov 2007 14:29:38 +0100
Message-ID: <000901c8278b$9271d450$0b0ffe0a@NS006819>
References: <000401c82770$f90872c0$0b0ffe0a@NS006819> <1195124670.17107.10.camel@basti79.freenet-ag.de> <Pine.LNX.4.64.0711151241310.5340@fbirervta.pbzchgretzou.qr>
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0711151241310.5340@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

>> diff -pruN xt_TEE.orig/iptables/.TEE-testx xt_TEE/iptables/.TEE-testx
>> --- xt_TEE.orig/iptables/.TEE-testx	2007-10-05 13:23:03.000000000
>> +0200 +++ xt_TEE/iptables/.TEE-testx	2007-10-05 14:37:10.000000000
>> +0200 @@ -1,2 +1,2 @@ #!/bin/sh
>> -[ -f "$KERNEL_DIR/net/netfilter/xt_TEE.h" ] && echo TEE
>> +[ -f "$KERNEL_DIR/net/netfilter/xt_TEE.c" ] && echo TEE
>
> Should have been /include/linux/netfilter/xt_TEE.h - changed
> accordingly. The .h file is what the build depends on, not
> the .c file.
>
> Merged the rest.

I've attached a diff for iptables extensions/Makefile.
When copying the libxt_TEE.* files to the iptables source dir, it
wouldn't compile the extension.


Grts,
Rob


begin 666 Makefile.diff
M+2TM(&5X=&5N<VEO;G,O36%K969I;&4),C P-RTQ,2TQ-2 Q-3HQ,CHQ-BXP
M,# P,# P,# @*S Q,# -"BLK*R!E>'1E;G-I;VYS+TUA:V5F:6QE?@DR,# W
M+3$Q+3$U(#$U.C$R.C$V+C P,# P,# P," K,#$P, T*0$ @+3<L-R K-RPW
M($! #0H@(PT*(%!&7T585%]33$E".CUA:"!A9&1R='EP92!C;VYN=')A8VL@
M96-N(&EC;7 @:7!R86YG92!O=VYE<B!P;VQI8WD@<F5A;&T@<F5C96YT('1O
M<R!T=&P@=6YC;&5A;B!#3%535$5225 @1$Y!5"!%0TX@3$]'($U!4U%515)!
M1$4@34E24D]2($Y%5$U!4"!2141)4D5#5"!214I%0U0@4T%-12!33D%4(%1/
M4R!45$P@54Q/1PT*(%!&-E]%6%1?4TQ)0CH]86@@9'-T(&5U:38T(&9R86<@
M:&)H(&AL(&EC;7 V(&EP=C9H96%D97(@;6@@;W=N97(@<&]L:6-Y(')T($A,
M($Q/1R!214I%0U0-"BU01EA?15A47U-,24(Z/6-O;FYB>71E<R!C;VYN;6%R
M:R!C;VYN;&EM:70@8V]M;65N="!D8V-P(&1S8W @97-P(&AA<VAL:6UI="!H
M96QP97(@;&5N9W1H(&QI;6ET(&UA8R!M87)K(&UU;'1I<&]R="!P:'ES9&5V
M('!K='1Y<&4@<75O=&$@<V-T<"!S=&%T92!S=&%T:7-T:6,@<W1A;F1A<F0@
M<W1R:6YG('1C<"!T8W!M<W,@=&EM92!U,S(@=61P($-,05-32499($-/3DY-
M05)+($130U @34%22R!.1DQ/1R!.1E%5155%($Y/5%)!0TL@5$-035-3(%1%
M12!44D%#10T**U!&6%]%6%1?4TQ)0CH]8V]N;F)Y=&5S(&-O;FYM87)K(&-O
M;FYL:6UI="!C;VUM96YT(&1C8W @9'-C<"!E<W @:&%S:&QI;6ET(&AE;'!E
M<B!L96YG=&@@;&EM:70@;6%C(&UA<FL@;75L=&EP;W)T('!H>7-D978@<&MT
M='EP92!Q=6]T82!S8W1P('-T871E('-T871I<W1I8R!S=&%N9&%R9"!S=')I
M;F<@=&-P('1C<&US<R!T:6UE('4S,B!U9' @0TQ!4U-)1ED@0T].3DU!4DL@
M1%-#4"!-05)+($Y&3$]'($Y&455%544@3D]44D%#2R!40U!-4U,@5%)!0T4-
M"B -"B!01E]%6%1?4T5,24Y56%]33$E".CT-"B!01C9?15A47U-%3$E.55A?
(4TQ)0CH]#0H`
`
end


