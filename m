From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: Bridges
Date: Tue, 24 Aug 2010 18:37:11 +0100
Message-ID: <4C740347.3010508@abpni.co.uk>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C59E2.4080307@riverviewtech.net> <4C6C5B87.9070906@abpni.co.uk> <alpine.LSU.2.01.1008190025100.29243@obet.zrqbmnf.qr> <4C6C63EF.7060305@abpni.co.uk> <4C6C6731.50401@plouf.fr.eu.org> <4C6C67A6.9010405@abpni.co.uk> <4C6C6AED.3090008@plouf.fr.eu.org> <4C6C70B6.7050200@abpni.co.uk> <4C6CDC91.6060804@plouf.fr.eu.org> <4C6D7C42.9060409@abpni.co.uk> <4C6D857B.1070906@plouf.fr.eu.org> <4C6D87E3.9080207@abpni.co.uk> <4C6D9E9F.3080507@plouf.fr.eu.org> <4C6DA0F1.80909@abpni.co.uk> <4C6DAA53.70702@plouf.fr.eu.org> <4C6DB5FD.8030607@abpni.co.uk> <4C6E42A6.9080308@plouf.fr.eu.org> <4C704924.3080909@abpni.co.uk> <alpine.LSU.2.01.1008220122410.30882@obet.zrqbmnf.qr> <4C70E853.6050107@abpni.co   .uk> <alpine.LSU.2.01.1008221108160.26133@obet.zrqbmnf.qr> <4C70E
 9A2.3040907@abpni.co.uk> <4C719073.7090506@plouf.fr.eu.org> <4C7194D3.7070803@abpni.co.uk> <4C722FAF.5030203@plouf.fr.eu.org> <4C72D7AA.1090206@abpni.co.uk> <4C73DABD.7080007@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C73DABD.7080007@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org


On 24/08/10 15:44, Pascal Hambourg wrote:
> Jonathan Tripathy a =E9crit :
>   =20
>> Ok, so as I understand Linux, and please correct me if I'm wrong, wh=
en a
>> packet comes into a physical interface on a Linux machine, regardles=
s of
>> the status of the net.ipv4.conf.<interface>.forwarding, Linux will
>> always put the packet onto a "chain". This will either be the INPUT
>> chain or the FORWARD chain. Is that correct?
>>     =20
> This is correct if you consider only the IP layer (IP stack, IP
> packets). If you consider the link layer (bridging, VLAN, bonding,
> tunnels...) things get more complicated.
>
>   =20
>> Next, if the packet it destined for an IP of one of the local
>> interfaces, it puts it onto the INPUT chain, correct?
>>     =20
> Correct.
>
>   =20
>> However if the packet it destined for a non-local host, it puts it o=
nto
>> the FORWARD chain, correct?
>>     =20
> Only if net.ipv4.ip_forward=3D1 or net.ipv4.conf.<interface>.forwardi=
ng=3D1,
> and the TTL is>  0 after being decremented. Otherwise the packet is
> discarded before entering the FORWARD chain.
>
>   =20
>> Then, when the packet is on the forward chain, it depends on if the
>> incoming interface is connected to a bridge or not.
>>     =20
> No, it doesn't. In the IP stack, the interface type does not not matt=
er.
> Only the routing table matters.
>
> Jan's diagram pointed to by Karel Rericha explains paths in the IP la=
yer
> and the link layer. However bridge-netfilter (the capability to send
> bridged packets through {ip,arp,ipv6}tables chains whereas they are n=
ot
> processed by the IP stack) makes things a bit more complicated.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   =20

I think what I am getting confused with is how am I able to use the=20
=46ORWARD chain in iptables with my bridge setup, even though forwardin=
g=20
is disabled?

Thanks
