From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Bridges
Date: Fri, 20 Aug 2010 10:53:58 +0200
Message-ID: <4C6E42A6.9080308@plouf.fr.eu.org>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C5739.5040106@abpni.co.uk> <4C6C59E2.4080307@riverviewtech.net> <4C6C5B87.9070906@abpni.co.uk> <alpine.LSU.2.01.1008190025100.29243@obet.zrqbmnf.qr> <4C6C63EF.7060305@abpni.co.uk> <4C6C6731.50401@plouf.fr.eu.org> <4C6C67A6.9010405@abpni.co.uk> <4C6C6AED.3090008@plouf.fr.eu.org> <4C6C70B6.7050200@abpni.co.uk> <4C6CDC91.6060804@plouf.fr.eu.org> <4C6D7C42.9060409@abpni.co.uk> <4C6D857B.1070906@plouf.fr.eu.org> <4C6D87E3.9080207@abpni.co.uk> <4C6D9E9F.3080507@plouf.fr.eu.org> <4C6DA0F1.80909@abpni.co.uk> <4C6DAA53.70702@plouf.fr.eu.org> <4C6DB5FD.8030607@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C6DB5FD.8030607@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org

Jonathan Tripathy a =E9crit :
>>>>>>> However, in the /proc/sys/net/ipv4/conf folder, I
>>>>>>> don't see my "public" bridge, only the private one. Incidently,=
 the
>>>>>>> private one is the only bridge in my system that has an IP addr=
ess
>>>>>>> asigned to it...
>>>>>>>             =20
>>>>>> Ok. May I ask what is your kernel version ? Older than 2.6.21 ?
>>>>>>           =20
>>>>> Linux xx.xx.xx.xx 2.6.18-194.8.1.el5xen #1 SMP Thu Jul 1 19:41:05=
 EDT
>>>>> 2010 x86_64 x86_64 x86_64 GNU/Linux
>>>>>         =20
>>>> As I expected. A change occured in 2.6.21, recent kernels automati=
cally
>>>> link interfaces to the IP stack.
>>>>       =20
>>> So in my case, am I at a disadvantage
>>>     =20
>> On the contrary, the old behaviour is an advantage if you don't want=
 an
>> interface to participate in IP operation.
>=20
> Excellent! If I were to upgrade at a later date, is it just a matter =
of=20
> making sure that everything returns 0 in the above files?

Setting net.ipv4.conf.<interface>.forwarding=3D0 will disable forwardin=
g
of IP packets received on <interface>. But I'm afraid it won't disable
all IP operation on it (ARP resolution, accept IP packets for local
delivery...)
