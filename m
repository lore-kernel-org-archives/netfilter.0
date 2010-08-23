From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: Bridges
Date: Mon, 23 Aug 2010 21:18:50 +0100
Message-ID: <4C72D7AA.1090206@abpni.co.uk>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C5739.5040106@abpni.co.uk> <4C6C59E2.4080307@riverviewtech.net> <4C6C5B87.9070906@abpni.co.uk> <alpine.LSU.2.01.1008190025100.29243@obet.zrqbmnf.qr> <4C6C63EF.7060305@abpni.co.uk> <4C6C6731.50401@plouf.fr.eu.org> <4C6C67A6.9010405@abpni.co.uk> <4C6C6AED.3090008@plouf.fr.eu.org> <4C6C70B6.7050200@abpni.co.uk> <4C6CDC91.6060804@plouf.fr.eu.org> <4C6D7C42.9060409@abpni.co.uk> <4C6D857B.1070906@plouf.fr.eu.org> <4C6D87E3.9080207@abpni.co.uk> <4C6D9E9F.3080507@plouf.fr.eu.org> <4C6DA0F1.80909@abpni.co.uk> <4C6DAA53.70702@plouf.fr.eu.org> <4C6DB5FD.8030607@abpni.co.uk> <4C6E42A6.9080308@plouf.fr.eu.org> <4C704924.3080909@abpni.co.uk> <alpine.LSU.2.01.1008220122410.30882@obet.zrqbmnf.qr> <4C70E853.6050107@abpni.co
   .uk> <alpine.LSU.2.01.1008221108160.26133@obet.zrqbmnf.qr> <4C70E9A2.3040907@abpni.co.uk> <4C719073.7090506@plouf.fr.eu.org> <4C7194D3.7070803@abpni.co.uk> <4C722FAF.5030203@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C722FAF.5030203@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org


On 23/08/10 09:22, Pascal Hambourg wrote:
> Jonathan Tripathy a =E9crit :
>   =20
>>> "IP routing" may have different meanings. It can be a synonym for "=
IP
>>> forwarding", like in "IP routers do IP routing". But in the context=
 of
>>> the Linux IP stack, it rather means the handling of an IP packet
>>> according to the routing table. In short :
>>> - for an incoming packet, determine whether it is for local deliver=
y or
>>> to be forwarded ;
>>> - for an outgoing or forwarded packet, determine the output interfa=
ce
>>> and gateway.
>>>       =20
>> I definitely still want link to do that though, with my bridge traff=
ic...
>>     =20
> Do what ? I don't understand, sorry.
>   =20

Sorry, I'm not wording my questions very well. Let me start from the=20
top. Thanks everyone for the fantastic help by the way :)

Ok, so as I understand Linux, and please correct me if I'm wrong, when =
a=20
packet comes into a physical interface on a Linux machine, regardless o=
f=20
the status of the net.ipv4.conf.<interface>.forwarding, Linux will=20
always put the packet onto a "chain". This will either be the INPUT=20
chain or the FORWARD chain. Is that correct?

Next, if the packet it destined for an IP of one of the local=20
interfaces, it puts it onto the INPUT chain, correct?

However if the packet it destined for a non-local host, it puts it onto=
=20
the FORWARD chain, correct?

Then, when the packet is on the forward chain, it depends on if the=20
incoming interface is connected to a bridge or not. If it is connected=20
to a bridge, the packet will transverse the FORWARD chain and go out th=
e=20
interface which must be part of the same bridge, correct?

If, however, the incoming interface is not connected to a bridge, Linux=
=20
will fordward the packet out of another interface which is thinks is=20
correct (as defined by the routing table), but it will only do this if=20
net.ipv4.conf.<interface>.forwarding is set to 1, correct?

Before I go on with my next set of question, I'd just like someone to=20
correct the above if it is wrong

Many Thanks
