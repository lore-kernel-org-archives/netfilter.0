From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: Bridges
Date: Sat, 21 Aug 2010 22:46:12 +0100
Message-ID: <4C704924.3080909@abpni.co.uk>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C5739.5040106@abpni.co.uk> <4C6C59E2.4080307@riverviewtech.net> <4C6C5B87.9070906@abpni.co.uk> <alpine.LSU.2.01.1008190025100.29243@obet.zrqbmnf.qr> <4C6C63EF.7060305@abpni.co.uk> <4C6C6731.50401@plouf.fr.eu.org> <4C6C67A6.9010405@abpni.co.uk> <4C6C6AED.3090008@plouf.fr.eu.org> <4C6C70B6.7050200@abpni.co.uk> <4C6CDC91.6060804@plouf.fr.eu.org> <4C6D7C42.9060409@abpni.co.uk> <4C6D857B.1070906@plouf.fr.eu.org> <4C6D87E3.9080207@abpni.co.uk> <4C6D9E9F.3080507@plouf.fr.eu.org> <4C6DA0F1.80909@abpni.co.uk> <4C6DAA53.70702@plouf.fr.eu.org> <4C6DB5FD.8030607@abpni.co.uk> <4C6E42A6.9080308@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C6E42A6.9080308@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org


On 20/08/10 09:53, Pascal Hambourg wrote:
> Jonathan Tripathy a =E9crit :
>   =20
>>>>>>>> However, in the /proc/sys/net/ipv4/conf folder, I
>>>>>>>> don't see my "public" bridge, only the private one. Incidently=
, the
>>>>>>>> private one is the only bridge in my system that has an IP add=
ress
>>>>>>>> asigned to it...
>>>>>>>>
>>>>>>>>                 =20
>>>>>>> Ok. May I ask what is your kernel version ? Older than 2.6.21 ?
>>>>>>>
>>>>>>>               =20
>>>>>> Linux xx.xx.xx.xx 2.6.18-194.8.1.el5xen #1 SMP Thu Jul 1 19:41:0=
5 EDT
>>>>>> 2010 x86_64 x86_64 x86_64 GNU/Linux
>>>>>>
>>>>>>             =20
>>>>> As I expected. A change occured in 2.6.21, recent kernels automat=
ically
>>>>> link interfaces to the IP stack.
>>>>>
>>>>>           =20
>>>> So in my case, am I at a disadvantage
>>>>
>>>>         =20
>>> On the contrary, the old behaviour is an advantage if you don't wan=
t an
>>> interface to participate in IP operation.
>>>       =20
>> Excellent! If I were to upgrade at a later date, is it just a matter=
 of
>> making sure that everything returns 0 in the above files?
>>     =20
> Setting net.ipv4.conf.<interface>.forwarding=3D0 will disable forward=
ing
> of IP packets received on<interface>. But I'm afraid it won't disable
> all IP operation on it (ARP resolution, accept IP packets for local
> delivery...)
>   =20

Just out of interest, if routing was enabled on the Dom0, how would the=
=20
guests be able to use it, if the bridge that they were connected to=20
didn't have an IP address? Assuming that all IPs for the other=20
interfaces on the Dom0 were on a different subnet..

Thanks
