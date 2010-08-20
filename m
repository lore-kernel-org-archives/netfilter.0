From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Bridges
Date: Fri, 20 Aug 2010 11:05:20 +0200
Message-ID: <4C6E4550.1020808@plouf.fr.eu.org>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C5739.5040106@abpni.co.uk> <4C6C59E2.4080307@riverviewtech.net> <4C6C5B87.9070906@abpni.co.uk> <alpine.LSU.2.01.1008190025100.29243@obet.zrqbmnf.qr> <4C6C63EF.7060305@abpni.co.uk> <4C6C6731.50401@plouf.fr.eu.org> <4C6C67A6.9010405@abpni.co.uk> <4C6C6AED.3090008@plouf.fr.eu.org> <4C6C70B6.7050200@abpni.co.uk> <4C6CDC91.6060804@plouf.fr.eu.org> <4C6D7C42.9060409@abpni.co.uk> <4C6D857B.1070906@plouf.fr.eu.org> <4C6D87E3.9080207@abpni.co.uk> <4C6D9E9F.3080507@plouf.fr.eu.org> <4C6DA0F1.80909@abpni.co.uk> <4C6DAA53.70702@plouf.fr.eu.org> <alpine.LSU.2.01.1008201038140.16356@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1008201038140.16356@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Jonathan Tripathy <jonnyt@abpni.co.uk>, netfilter@vger.kernel.org

Jan Engelhardt a =E9crit :
> On Friday 2010-08-20 00:04, Pascal Hambourg wrote:
>>>>>>       =20
>>>>> Linux xx.xx.xx.xx 2.6.18-194.8.1.el5xen #1 SMP Thu Jul 1 19:41:05=
 EDT
>>>>> 2010 x86_64 x86_64 x86_64 GNU/Linux
>>>>>     =20
>>>> As I expected. A change occured in 2.6.21, recent kernels automati=
cally
>>>> link interfaces to the IP stack.
>>>>   =20
>>> So in my case, am I at a disadvantage
>> On the contrary, the old behaviour is an advantage if you don't want=
 an
>> interface to participate in IP operation.
>=20
> Well not really, there is always iptables and ebtables.

Ebtables is available only on bridge interfaces. Here the interface is =
a
bridge, but what if you don't want IP on a normal interface ?
Also, iptables won't disable ARP so arptables is required too.

Isn't there a cleaner way to "detach" an interface from the IP stack ?
