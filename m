From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: [SOLVED] PPPoE on a bridge, nat sees bridge as incoming interface
Date: Tue, 11 Mar 2008 16:49:41 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0803111644520.19018@fbirervta.pbzchgretzou.qr>
References: <20080306172218.GA14566@possum.gg3.net> <47D07205.10906@plouf.fr.eu.org>
 <20080306172218.GA14566@possum.gg3.net> <47D069BF.9080208@riverviewtech.net>
 <20080311110854.GA8806@possum.gg3.net> <Pine.LNX.4.64.0803111304160.24076@fbirervta.pbzchgretzou.qr>
 <47D697E6.2050301@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47D697E6.2050301@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>


On Mar 11 2008 15:32, Pascal Hambourg wrote:
> Jan Engelhardt a =C3=A9crit :
>> >
>> >Problem: If a PPPoE connection is initialized over a bridge the nat
>> >table will see any incoming IP packet as coming from the bridge
>> >interface, and not the ppp interface.
>>=20
>> Solution 3: iptables -m physdev --physdev-in ppp0 -i br0
>>             ebtables --logical-in ppp0 -i br0
>
> Could you elaborate, please ?

Oh, I misread it. ppp0 on br0 hm... like I said before, the
ip_tables nat table should never even see PPP, only ebtables nat may,
and it can be matched with (--logical-in br0 -i/-o ppp0 -p 0x880b),
does not it?


> Also, the targets are missing.

The target is for you to decide.
